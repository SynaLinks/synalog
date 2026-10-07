# Test: Negating the result of a functor. (from tests/programs/negation/18_negation_of_a_functor_result.l)

Src(x: 0);
Kept(x:) :- Src(x:);
Base(x:) :- x in [1, 2];
K := Kept(Src: Base);
V(x:) :- x in [1, 2, 3];
N(x:) :- V(x:), ~K(x:);
