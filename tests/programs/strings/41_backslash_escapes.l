# Single-quoted strings take backslash escapes.
# Expect: rows S = [(1, 3)]
S(a: Length('\t'), b: Length('a\\b'));
