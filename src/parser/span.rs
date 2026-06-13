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
        let stop = stop.min(heritage.len());
        let start = start.min(stop);
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
