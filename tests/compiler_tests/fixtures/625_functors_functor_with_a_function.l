# Test: A functor of a rule using a function. (from tests/programs/functors/15_functor_with_a_function.l)

Sq(x) = x * x;
Src(x: 0);
Squares(y: Sq(x)) :- Src(x:);
Base(x:) :- x in [1, 2];
S := Squares(Src: Base);
@OrderBy(R, "y");
R(y:) :- S(y:);
