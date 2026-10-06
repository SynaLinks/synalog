# Numbers concatenated with an empty list.
# Expect: rows Q = [(2, 2)]
Q(n: Size(c), first: Element(c, 0)) :- c == ArrayConcat([2, 3], []);
