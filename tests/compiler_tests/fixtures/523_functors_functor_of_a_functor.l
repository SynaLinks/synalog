# Test: A functor applied to a functor's result. (from tests/programs/functors/09_functor_of_a_functor.l)

Src(x: 0);
Doubled(y: 2 * x) :- Src(x:);
Base(x:) :- x in [1, 2];
D1 := Doubled(Src: Base);
Src2(x: 0);
Twice(y: 2 * x) :- Src2(x:);
D1x(x: y) :- D1(y:);
D2 := Twice(Src2: D1x);
@OrderBy(T, "y");
T(y:) :- D2(y:);
