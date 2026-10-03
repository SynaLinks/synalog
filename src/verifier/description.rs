// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

//! Description check.
//!
//! Front matter is how a program file says what it is: its `name` is the
//! predicate it is about, its `description` what that predicate's rows are —
//! the words someone searches for to find it. A file that opens front matter
//! must describe itself: a `description` with text in it. Programs without
//! front matter are not checked.

use crate::errors::VerifyError;
use crate::parser::Json;

/// The front matter has no description, or an empty one.
#[derive(Debug, Clone)]
pub struct DescriptionError {
    /// The predicate the front matter names, if it names one.
    pub predicate: Option<String>,
}

impl std::fmt::Display for DescriptionError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "{}", VerifyError::from(self.clone()))
    }
}

impl From<DescriptionError> for VerifyError {
    fn from(e: DescriptionError) -> Self {
        VerifyError::MissingDescription { predicate: e.predicate }
    }
}

/// `Some(error)` when the program opens front matter without a non-empty
/// text `description`.
pub fn check_description(parsed: &Json) -> Option<DescriptionError> {
    let fm = parsed.as_object().get("front_matter")?.as_object();
    let described = fm.get("description").is_some_and(|d| d.is_string() && !d.as_str().is_empty());
    if described {
        return None;
    }
    let predicate = fm.get("name").filter(|n| n.is_string()).map(|n| n.as_str().to_string());
    Some(DescriptionError { predicate })
}

#[cfg(test)]
mod tests {
    use crate::parser::parse_file;
    use crate::verifier::{validate, CheckError};

    fn description_errors(source: &str) -> Vec<String> {
        let parsed = parse_file(source, None, &[]).expect("parses");
        validate(&parsed)
            .errors
            .iter()
            .filter(|e| matches!(e, CheckError::Description(_)))
            .map(|e| e.to_string())
            .collect()
    }

    const BODY: &str = "@OrderBy(T, \"x\");\nT(x:) :- x in Range(3);\n";

    #[test]
    fn a_description_passes() {
        assert!(description_errors(&format!("---\nname: T\ndescription: Three numbers.\n---\n{BODY}")).is_empty());
    }

    #[test]
    fn no_description_fails_and_names_the_predicate() {
        let errors = description_errors(&format!("---\nname: T\n---\n{BODY}"));
        assert_eq!(errors.len(), 1);
        assert!(errors[0].starts_with("The front matter has no description for 'T'"), "{}", errors[0]);
    }

    #[test]
    fn an_empty_or_blank_description_fails() {
        assert_eq!(description_errors(&format!("---\nname: T\ndescription:\n---\n{BODY}")).len(), 1);
        assert_eq!(description_errors(&format!("---\nname: T\ndescription: \"   \"\n---\n{BODY}")).len(), 1);
    }

    #[test]
    fn a_description_that_is_not_text_fails() {
        assert_eq!(description_errors(&format!("---\nname: T\ndescription: [a, b]\n---\n{BODY}")).len(), 1);
    }

    #[test]
    fn front_matter_without_a_name_still_needs_a_description() {
        let errors = description_errors(&format!("---\nkeywords: [x]\n---\n{BODY}"));
        assert_eq!(errors.len(), 1);
        assert!(errors[0].starts_with("The front matter has no description: "), "{}", errors[0]);
    }

    #[test]
    fn no_front_matter_is_not_checked() {
        assert!(description_errors(BODY).is_empty());
    }
}
