# Test: A functor replaces the predicate a rule reads. (from tests/programs/functors/01_substitute_a_predicate.l)

Src(x: 0);
Doubled(y: 2 * x) :- Src(x:);
Base(x:) :- x in [1, 2];
D := Doubled(Src: Base);
@OrderBy(D, "y");
