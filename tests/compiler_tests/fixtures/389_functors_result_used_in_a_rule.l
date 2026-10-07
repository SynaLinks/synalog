# Test: The result of a functor is read like any predicate. (from tests/programs/functors/06_result_used_in_a_rule.l)

Src(x: 0);
Doubled(y: 2 * x) :- Src(x:);
Base(x:) :- x in [1, 2, 3];
D := Doubled(Src: Base);
T(y:) :- D(y:), y > 4;
