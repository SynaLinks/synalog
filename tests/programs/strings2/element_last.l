# The last element.
# Expect: rows Q = [("c",)]
Q(s: Element(l, Size(l) - 1)) :- l == Split("a,b,c", ",");
