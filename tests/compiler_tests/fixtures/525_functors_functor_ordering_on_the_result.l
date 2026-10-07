# Test: Ordering the result of a functor. (from tests/programs/functors/11_functor_ordering_on_the_result.l)

Src(x: 0);
Doubled(y: 2 * x) :- Src(x:);
Base(x:) :- x in [1, 2];
D := Doubled(Src: Base);
@OrderBy(D, "y desc");
