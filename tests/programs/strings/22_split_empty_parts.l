# Split keeps empty parts.
# Expect: rows S = [(3,)]
S(n: Size(Split("a,,b", ",")));
