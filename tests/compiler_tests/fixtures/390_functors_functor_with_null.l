# Test: A functor over a predicate holding a null. (from tests/programs/functors/07_functor_with_null.l)

Src(x: 0);
Count(n? += 1) distinct :- Src(x:), x is null;
WithNull(x: null);
WithNull(x: 1);
T := Count(Src: WithNull);
