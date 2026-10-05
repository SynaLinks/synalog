// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

use std::sync::Arc;

/// A string span that tracks its position in the original source text (heritage).
#[derive(Clone, Debug)]
pub struct SpanString {
    pub heritage: Arc<String>,
    pub start: usize,
    pub stop: usize, // exclusive
}

impl SpanString {
    pub fn new(s: String) -> Self {
        let len = s.len();
        SpanString {
            heritage: Arc::new(s),
            start: 0,
            stop: len,
        }
    }

    pub fn from_arc(heritage: Arc<String>, start: usize, stop: usize) -> Self {
        // The parser steps over the text byte by byte (`idx..idx + 1`): a span
        // edge inside a character of several bytes (`é`, `∀`) is moved to the
        // character's boundary, so a span always holds whole characters.
        let mut stop = stop.min(heritage.len());
        while !heritage.is_char_boundary(stop) {
            stop += 1;
        }
        let mut start = start.min(stop);
        while !heritage.is_char_boundary(start) {
            start -= 1;
        }
        SpanString {
            heritage,
            start,
            stop,
        }
    }

    pub fn len(&self) -> usize {
        self.stop - self.start
    }

    pub fn is_empty(&self) -> bool {
        self.len() == 0
    }

    pub fn view(&self) -> &str {
        &self.heritage[self.start..self.stop]
    }

    pub fn to_string(&self) -> String {
        self.view().to_string()
    }

    pub fn at(&self, i: usize) -> u8 {
        self.heritage.as_bytes()[self.start + i]
    }

    pub fn slice(&self, rel_start: usize, rel_stop: usize) -> SpanString {
        SpanString::from_arc(
            Arc::clone(&self.heritage),
            self.start + rel_start,
            self.start + rel_stop,
        )
    }

    pub fn slice_from(&self, rel_start: usize) -> SpanString {
        self.slice(rel_start, self.len())
    }

    pub fn slice_to(&self, rel_stop: usize) -> SpanString {
        self.slice(0, rel_stop)
    }

    pub fn starts_with(&self, prefix: &str) -> bool {
        self.view().starts_with(prefix)
    }

    pub fn ends_with(&self, suffix: &str) -> bool {
        self.view().ends_with(suffix)
    }

    /// Returns (before, mid, after) pieces for error display.
    pub fn pieces(&self) -> (&str, &str, &str) {
        (
            &self.heritage[..self.start],
            &self.heritage[self.start..self.stop],
            &self.heritage[self.stop..],
        )
    }
}

#[cfg(test)]
#[path = "span_test.rs"]
mod span_test;

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn a_span_inside_a_character_holds_the_whole_character() {
        let s = SpanString::new("é∀x".to_string());
        assert_eq!(s.slice(0, 1).view(), "é");
        assert_eq!(s.slice(1, 3).view(), "é∀");
        assert_eq!(s.slice(3, 4).view(), "∀");
    }
}

#[cfg(test)]
mod parse_tests {
    #[test]
    fn text_with_non_ascii_characters_is_an_error_not_a_panic() {
        // A double-quoted string with a quote in it, after a character of
        // several bytes; and a program starting with one.
        for source in ["S(a: \"∀ \\\"x\\\"\");", "éA(x: 1);", "S(a: \"∀\");"] {
            let _ = crate::parser::parse_file(source, None, &[]);
        }
    }
}
