# StartsWith of accented text.
# Expect: rows Q = [(1,)]
Q(x: 1) :- StartsWith("éclair", "éc");
