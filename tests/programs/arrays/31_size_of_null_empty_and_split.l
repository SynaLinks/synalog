# Size of an empty list is 0, of a null is null; Split of "" is one part.
# Expect: rows A = [(1, 1), (2, 2), (3, None)]
# Expect: rows B = [(1, 0), (2, 2)]
V(k: 1, s: "");
V(k: 2, s: "a,b");
V(k: 3, s: null);
@OrderBy(A, "k");
A(k:, n: Size(Split(s, ","))) :- V(k:, s:);
W(k: 1, l: []);
W(k: 2, l: [1, 2]);
@OrderBy(B, "k");
B(k:, n: Size(l)) :- W(k:, l:);
