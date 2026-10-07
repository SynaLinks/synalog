// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

//! The names predicates were written with.
//!
//! An import gives the predicates of the file it brings in a prefixed name
//! (`Numbers` of `lib/numbers.l` becomes `Numbers_Numbers`), so two files can
//! define the same one. That name is the compiler's: what reaches the user, in
//! an error or a report, is the name as it was written, and a command takes it
//! the same way.

use super::Json;

/// The key of a parsed program holding its `{internal name: written name}`.
pub const PREDICATE_NAMES: &str = "predicate_names";

/// The written names of a parsed program's imported predicates.
#[derive(Debug, Default, Clone)]
pub struct PredicateNames {
    /// `(internal, written)`, one per imported predicate whose written name is
    /// no other predicate's.
    pairs: Vec<(String, String)>,
}

impl PredicateNames {
    /// The names of a parsed program (none for a program without imports).
    pub fn of(parsed: &Json) -> Self {
        let pairs = parsed
            .as_object()
            .get(PREDICATE_NAMES)
            .filter(|names| names.is_object())
            .map(|names| {
                names
                    .as_object()
                    .iter()
                    .filter(|(_, written)| written.is_string())
                    .map(|(internal, written)| (internal.clone(), written.as_str().to_string()))
                    .collect()
            })
            .unwrap_or_default();
        Self { pairs }
    }

    /// `text` with every predicate named as it was written.
    pub fn written(&self, text: &str) -> String {
        if self.pairs.is_empty() {
            return text.to_string();
        }
        let is_ident = |c: char| c.is_alphanumeric() || c == '_';
        let mut out = String::with_capacity(text.len());
        let mut chars = text.char_indices().peekable();
        while let Some((start, c)) = chars.next() {
            if !is_ident(c) {
                out.push(c);
                continue;
            }
            let mut end = start + c.len_utf8();
            while let Some(&(i, next)) = chars.peek() {
                if !is_ident(next) {
                    break;
                }
                end = i + next.len_utf8();
                chars.next();
            }
            let word = &text[start..end];
            match self.pairs.iter().find(|(internal, _)| internal == word) {
                Some((_, written)) => out.push_str(written),
                None => out.push_str(word),
            }
        }
        out
    }

    /// The compiler's name of the predicate written `name` (`name` itself for
    /// a predicate of the main file).
    pub fn internal(&self, name: &str) -> String {
        self.pairs
            .iter()
            .find(|(_, written)| written == name)
            .map_or_else(|| name.to_string(), |(internal, _)| internal.clone())
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::parser::JsonObject;

    fn names() -> PredicateNames {
        let mut map = JsonObject::new();
        map.insert("Numbers_Numbers".into(), Json::Str("Numbers".into()));
        let mut parsed = JsonObject::new();
        parsed.insert(PREDICATE_NAMES.into(), Json::Object(map));
        PredicateNames::of(&Json::Object(parsed))
    }

    #[test]
    fn a_message_names_predicates_as_written() {
        assert_eq!(
            names().written("'Numbers_Numbers' has 1 column (x); Numbers_Numbers_x and MyNumbers_Numbers stay"),
            "'Numbers' has 1 column (x); Numbers_Numbers_x and MyNumbers_Numbers stay"
        );
    }

    #[test]
    fn a_written_name_finds_its_predicate() {
        assert_eq!(names().internal("Numbers"), "Numbers_Numbers");
        assert_eq!(names().internal("Other"), "Other");
    }

    #[test]
    fn a_program_without_imports_has_no_names() {
        let parsed = Json::Object(JsonObject::new());
        assert_eq!(PredicateNames::of(&parsed).written("Numbers_Numbers"), "Numbers_Numbers");
    }
}
