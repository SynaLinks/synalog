# Test: A functor of a rule with a negation. (from tests/programs/functors/10_functor_with_a_negation.l)

Src(x: 0);
Excluded(x: 2);
Kept(x:) :- Src(x:), ~Excluded(x:);
Base(x:) :- x in [1, 2];
T := Kept(Src: Base);
