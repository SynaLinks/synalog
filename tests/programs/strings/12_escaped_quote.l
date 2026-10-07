# Quotes inside a string: single-quoted strings take backslash escapes,
# triple-quoted ones hold double quotes as they are.
# Expect: rows S = [('say "hi"', 'say "hi" there', "it's", 'a\tb')]
S(a: 'say "hi"', b: """say "hi" there""", c: 'it\'s', d: 'a\tb');
