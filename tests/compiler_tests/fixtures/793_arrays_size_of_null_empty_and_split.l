# Test: Size of an empty list is 0, of a null is null; Split of "" is one part. (from tests/programs/arrays/31_size_of_null_empty_and_split.l)

V(k: 1, s: "");
V(k: 2, s: "a,b");
V(k: 3, s: null);
W(k: 1, l: []);
W(k: 2, l: [1, 2]);
@OrderBy(B, "k");
B(k:, n: Size(l)) :- W(k:, l:);
@OrderBy(A, "k");
A(k:, n: Size(Split(s, ","))) :- V(k:, s:);
