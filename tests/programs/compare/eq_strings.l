# Pairs of strings with a == b.
# Expect: rows C = [('a', 'a'), ('b', 'b')]
V(s:) :- s in ["a", "b"];
@OrderBy(C, "a", "b");
C(a:, b:) :- V(s: a), V(s: b), a == b;
