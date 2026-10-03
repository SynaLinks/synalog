# A statement without its ;.
# Expect: error Parsing

Item(x:) :- x in [1, 2]
Total(x:) :- Item(x:);
