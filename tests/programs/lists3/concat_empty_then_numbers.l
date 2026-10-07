# An empty list concatenated with numbers.
# Expect: rows Q = [(2, 3)]
Q(n: Size(c), last: Element(c, 1)) :- c == ArrayConcat([], [2, 3]);
