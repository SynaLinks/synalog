# Test: Quotes inside a string: single-quoted strings take backslash escapes, triple-quoted ones hold double quotes as they are. (from tests/programs/strings/12_escaped_quote.l)

S(a: 'say "hi"', b: """say "hi" there""", c: 'it\'s', d: 'a\tb');
