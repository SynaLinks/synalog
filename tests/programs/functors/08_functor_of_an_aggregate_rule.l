# A functor applied to a rule that aggregates by group.
# Expect: rows R = [("a", 3), ("b", 4)]
S0(g: "z", v: 0);
ByGroup(g:, t? += v) distinct :- S0(g:, v:);
S1(g: "a", v: 1);
S1(g: "a", v: 2);
S1(g: "b", v: 4);
R0 := ByGroup(S0: S1);
@OrderBy(R, "g");
R(g:, t:) :- R0(g:, t:);
