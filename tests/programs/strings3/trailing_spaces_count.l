# Trailing spaces are characters.
# Expect: rows Q = [(3, 1)]
Q(n: Length("ab "), d: (if "ab " == "ab" then 1 else 0) + 1);
