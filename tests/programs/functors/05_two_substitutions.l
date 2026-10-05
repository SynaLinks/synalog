# A functor replaces two predicates at once.
# Expect: rows J = [(1, "a")]
L(k: 0, v: "z");
R(k: 0, w: 0);
Joined(v:, w:) :- L(k:, v:), R(k:, w:);
L2(k: 1, v: "a");
R2(k: 1, w: 1);
J0 := Joined(L: L2, R: R2);
J(w:, v:) :- J0(v:, w:);
