# An ordered list of records, its fields joined.
# Expect: rows Q = [("c-a-b",)]
V(k: 3, n: "b");
V(k: 1, n: "c");
V(k: 2, n: "a");
L(l? Array= k -> {n:}) distinct :- V(k:, n:);
N(i:, n: Element(l, i).n) :- L(l:), i in Range(Size(l));
J(s? Array= i -> n) distinct :- N(i:, n:);
Q(s: Join(s, "-")) :- J(s:);
