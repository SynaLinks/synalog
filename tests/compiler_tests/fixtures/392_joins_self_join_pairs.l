# Test: Pairs from one predicate. (from tests/programs/joins/09_self_join_pairs.l)

V(x:) :- x in [1, 2, 3];
@OrderBy(J, "a", "b");
J(a:, b:) :- V(x: a), V(x: b), a < b;
