# Joining with a quote and a backslash.
# Expect: rows Q = [("a'\\\\b",)]
Q(s: Join(["a", "b"], "'\\"));
