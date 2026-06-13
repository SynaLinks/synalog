// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

use crate::parser::span::SpanString;
use crate::errors::{ParseError, SourceLocation};

/// Parsing error with source location.
#[derive(Debug, Clone)]
pub struct ParsingException {
    pub message: String,
    pub location: SpanString,
}

impl ParsingException {
    pub fn new(message: impl Into<String>, location: SpanString) -> Self {
        ParsingException {
            message: message.into(),
            location,
        }
    }

    pub fn show_message(&self) -> String {
        let (before_full, mid_raw, after_full) = self.location.pieces();
        let before = if before_full.len() > 300 {
            &before_full[before_full.len() - 300..]
        } else {
            before_full
        };
        let after = if after_full.len() > 300 {
            &after_full[..300]
        } else {
            after_full
        };
        let mid = if mid_raw.is_empty() { "<EMPTY>" } else { mid_raw };
        format!(
            "Parsing:\n{}{}{}\n\n[ Error ] {}\n",
            before, mid, after, self.message
        )
    }

    /// Convert to the unified ParseError type.
    pub fn to_parse_error(&self) -> ParseError {
        let (before_full, mid_raw, after_full) = self.location.pieces();
        let before = if before_full.len() > 300 {
            before_full[before_full.len() - 300..].to_string()
        } else {
            before_full.to_string()
        };
        let after = if after_full.len() > 300 {
            after_full[..300].to_string()
        } else {
            after_full.to_string()
        };
        let highlighted = if mid_raw.is_empty() {
            "<EMPTY>".to_string()
        } else {
            mid_raw.to_string()
        };

        ParseError::Syntax {
            message: self.message.clone(),
            location: Some(SourceLocation {
                before,
                highlighted,
                after,
                line: None,
                column: None,
            }),
        }
    }
}

impl std::fmt::Display for ParsingException {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "{}", self.show_message())
    }
}

impl std::error::Error for ParsingException {}

impl From<ParsingException> for ParseError {
    fn from(e: ParsingException) -> Self {
        e.to_parse_error()
    }
}

impl From<ParsingException> for crate::errors::SynalogError {
    fn from(e: ParsingException) -> Self {
        crate::errors::SynalogError::Parse(e.into())
    }
}

pub type ParseResult<T> = Result<T, ParsingException>;

#[inline]
fn close_to_open(c: u8) -> Option<u8> {
    match c {
        b')' => Some(b'('),
        b'}' => Some(b'{'),
        b']' => Some(b'['),
        _ => None,
    }
}

#[derive(Debug, Clone, Copy, PartialEq)]
pub enum TraverseStatus {
    Ok,
    Unmatched,
    EolInString,
}

#[derive(Debug, Clone, Copy)]
pub struct TraverseStep {
    pub idx: usize,
    pub state_depth: usize,
    pub state_top: u8,
    pub status: TraverseStatus,
}

impl TraverseStep {}

pub struct Traverser {
    s: SpanString,
    idx: isize,
    state: Vec<u8>,
}

impl Traverser {
    pub fn new(s: SpanString) -> Self {
        Traverser {
            s,
            idx: -1,
            state: Vec::new(),
        }
    }

    fn current_state(&self) -> u8 {
        self.state.last().copied().unwrap_or(0)
    }

    fn sub2(&self, i: usize) -> &[u8] {
        let bytes = self.s.view().as_bytes();
        let rel = i;
        if rel + 2 <= bytes.len() {
            &bytes[rel..rel + 2]
        } else {
            &[]
        }
    }

    fn sub3(&self, i: usize) -> &[u8] {
        let bytes = self.s.view().as_bytes();
        let rel = i;
        if rel + 3 <= bytes.len() {
            &bytes[rel..rel + 3]
        } else {
            &[]
        }
    }

    #[inline]
    fn make_step(&self, idx: usize, status: TraverseStatus) -> TraverseStep {
        TraverseStep {
            idx,
            state_depth: self.state.len(),
            state_top: self.state.last().copied().unwrap_or(0),
            status,
        }
    }

    pub fn next(&mut self) -> Option<TraverseStep> {
        // Loop instead of tail recursion to handle comment/whitespace skipping
        // without stack growth.
        loop {
        if (self.idx + 1) as usize >= self.s.len() {
            return None;
        }
        self.idx += 1;
        let idx = self.idx as usize;
        let c = self.s.view().as_bytes()[idx];
        let st = self.current_state();
        let mut track_parenthesis = true;

        if st == b'#' {
            track_parenthesis = false;
            if c == b'\n' {
                self.state.pop();
            } else {
                continue; // was: return self.next();
            }
        } else if st == b'"' {
            track_parenthesis = false;
            if c == b'\n' {
                return Some(TraverseStep {
                    idx,
                    state_depth: 0,
                    state_top: 0,
                    status: TraverseStatus::EolInString,
                });
            }
            if c == b'"' {
                self.state.pop();
            }
        } else if st == b'\'' {
            track_parenthesis = false;
            if c == b'\'' {
                self.state.pop();
            }
            if c == b'\\' {
                self.state.push(b'\\');
            }
        } else if st == b'\\' {
            self.state.pop();
        } else if st == b'`' {
            track_parenthesis = false;
            if c == b'`' {
                self.state.pop();
            }
        } else if st == b'3' {
            // Triple-quote mode
            track_parenthesis = false;
            if self.sub3(idx) == b"\"\"\"" {
                self.state.pop();
                let step = self.make_step(idx, TraverseStatus::Ok);
                self.state.push(1); // pending markers
                self.state.push(1);
                return Some(step);
            }
        } else if st == b'/' {
            // Block comment mode (track_parenthesis not needed, we continue/skip)
            if self.sub2(idx) == b"*/" {
                self.state.pop();
                self.idx += 1; // consume '/'
            }
            continue; // was: return self.next();
        } else if st == 1 {
            // Pending extra yields after closing triple quotes
            self.state.pop();
            return Some(self.make_step(idx, TraverseStatus::Ok));
        } else {
            // Not in comment or string
            if c == b'#' {
                self.state.push(b'#');
                continue; // was: return self.next();
            }
            if self.sub3(idx) == b"\"\"\"" {
                self.state.push(b'3');
                let step = self.make_step(idx, TraverseStatus::Ok);
                self.state.push(1);
                self.state.push(1);
                return Some(step);
            }
            if c == b'"' {
                self.state.push(b'"');
            } else if c == b'\'' {
                self.state.push(b'\'');
            } else if c == b'`' {
                self.state.push(b'`');
            } else if self.sub2(idx) == b"/*" {
                self.state.push(b'/');
                self.idx += 1; // consume '*'
                continue; // was: return self.next();
            }
        }

        if track_parenthesis {
            if c == b'(' || c == b'{' || c == b'[' {
                self.state.push(c);
            } else if c == b')' || c == b'}' || c == b']' {
                if let Some(open) = close_to_open(c) {
                    if self.state.last() == Some(&open) {
                        self.state.pop();
                    } else {
                        return Some(TraverseStep {
                            idx,
                            state_depth: 0,
                            state_top: 0,
                            status: TraverseStatus::Unmatched,
                        });
                    }
                }
            }
        }

        return Some(self.make_step(idx, TraverseStatus::Ok));
        } // end loop
    }
}

pub fn remove_comments(s: &SpanString) -> ParseResult<String> {
    let mut bytes = Vec::with_capacity(s.len());
    let mut t = Traverser::new(s.clone());
    while let Some(step) = t.next() {
        match step.status {
            TraverseStatus::Unmatched => {
                return Err(ParsingException::new(
                    "Parenthesis matches nothing.",
                    s.slice(step.idx, step.idx + 1),
                ));
            }
            TraverseStatus::EolInString => {
                return Err(ParsingException::new(
                    "End of line in string.",
                    s.slice(step.idx, step.idx),
                ));
            }
            TraverseStatus::Ok => {
                // Push raw byte to preserve UTF-8 multi-byte sequences.
                bytes.push(s.view().as_bytes()[step.idx]);
            }
        }
    }
    // The input was valid UTF-8, and we only removed comment bytes (all ASCII),
    // so the result is still valid UTF-8.
    Ok(String::from_utf8(bytes).unwrap_or_else(|e| String::from_utf8_lossy(e.as_bytes()).into_owned()))
}

pub fn is_whole(s: &SpanString) -> bool {
    let mut t = Traverser::new(s.clone());
    let mut status = TraverseStatus::Ok;
    let mut depth = 0usize;
    while let Some(step) = t.next() {
        status = step.status;
        depth = step.state_depth;
    }
    status == TraverseStatus::Ok && depth == 0
}

pub fn strip_spaces(s: &SpanString) -> SpanString {
    let v = s.view();
    if v.is_empty() {
        return s.slice(0, 0);
    }
    let bytes = v.as_bytes();
    let mut left = 0;
    while left < bytes.len() && bytes[left].is_ascii_whitespace() {
        left += 1;
    }
    let mut right = bytes.len();
    while right > left && bytes[right - 1].is_ascii_whitespace() {
        right -= 1;
    }
    s.slice(left, right)
}

pub fn strip(input: &SpanString) -> SpanString {
    let mut s = input.clone();
    loop {
        s = strip_spaces(&s);
        if s.len() >= 2
            && s.at(0) == b'('
            && s.at(s.len() - 1) == b')'
            && is_whole(&s.slice(1, s.len() - 1))
        {
            s = s.slice(1, s.len() - 1);
        } else {
            return s;
        }
    }
}

pub fn split_raw(s: &SpanString, separator: &str) -> ParseResult<Vec<SpanString>> {
    let mut parts = Vec::with_capacity(4);
    let sep_bytes = separator.as_bytes();
    let l = sep_bytes.len();
    if l == 0 {
        parts.push(s.clone());
        return Ok(parts);
    }

    let mut t = Traverser::new(s.clone());
    let mut part_start: usize = 0;
    let sep_alphanum = separator.bytes().all(|b| b.is_ascii_alphanumeric());
    let v = s.view().as_bytes();

    while let Some(step) = t.next() {
        if step.status != TraverseStatus::Ok {
            return Err(ParsingException::new(
                "Parenthesis matches nothing.",
                s.slice(step.idx, step.idx + 1),
            ));
        }
        if step.state_depth > 0 {
            continue;
        }

        let i = step.idx;
        if i + l <= v.len() && &v[i..i + l] == sep_bytes {
            // Avoid parsing || as two |
            if l == 1 && sep_bytes[0] == b'|' {
                if i + 1 < v.len() && v[i + 1] == b'|' {
                    continue;
                }
                if i > 0 && v[i - 1] == b'|' {
                    continue;
                }
            }

            if sep_alphanum {
                let left_ok = !(i > 0 && v[i - 1].is_ascii_alphanumeric());
                let right_ok = !((i + l) < v.len() && v[i + l].is_ascii_alphanumeric());
                if !left_ok || !right_ok {
                    continue;
                }
            }

            parts.push(s.slice(part_start, i));
            // Skip separator length - 1 characters
            for _ in 0..l - 1 {
                t.next();
            }
            part_start = i + l;
        }
    }

    parts.push(s.slice(part_start, s.len()));
    Ok(parts)
}

pub fn split(s: &SpanString, separator: &str) -> ParseResult<Vec<SpanString>> {
    let raw = split_raw(s, separator)?;
    Ok(raw.into_iter().map(|p| strip(&p)).collect())
}

pub fn split_in_two(s: &SpanString, separator: &str) -> ParseResult<(SpanString, SpanString)> {
    let mut parts = split(s, separator)?;
    if parts.len() != 2 {
        return Err(ParsingException::new(
            format!(
                "I expected string to be split by {} in two.",
                separator
            ),
            s.clone(),
        ));
    }
    let second = parts.pop().unwrap();
    let first = parts.pop().unwrap();
    Ok((first, second))
}

pub fn split_in_one_or_two(
    s: &SpanString,
    separator: &str,
) -> ParseResult<Result<SpanString, (SpanString, SpanString)>> {
    let mut parts = split(s, separator)?;
    match parts.len() {
        1 => Ok(Ok(parts.pop().unwrap())),
        2 => {
            let second = parts.pop().unwrap();
            let first = parts.pop().unwrap();
            Ok(Err((first, second)))
        }
        _ => Err(ParsingException::new(
            format!(
                "String should have been split by {} in 1 or 2 pieces.",
                separator
            ),
            s.clone(),
        )),
    }
}

pub fn split_on_whitespace(s: &SpanString) -> ParseResult<Vec<SpanString>> {
    let mut ss = vec![s.clone()];
    for sep in [" ", "\n", "\t"] {
        let mut out = Vec::with_capacity(ss.len());
        for chunk in &ss {
            let parts = split(chunk, sep)?;
            out.extend(parts);
        }
        ss = out;
    }
    Ok(ss.into_iter().filter(|c| !c.is_empty()).collect())
}

#[cfg(test)]
#[path = "traverse_test.rs"]
mod traverse_test;
