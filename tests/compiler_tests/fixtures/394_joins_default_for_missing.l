# Test: A default when the joined row is missing, by negation. (from tests/programs/joins/11_default_for_missing.l)

K(k:) :- k in [1, 2];
Name(k: 1, n: "one");
@OrderBy(J, "k");
J(k:, n:) :- K(k:), Name(k:, n:);
J(k:, n: "none") :- K(k:), ~Name(k:);
