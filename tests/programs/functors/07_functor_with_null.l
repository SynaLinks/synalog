# A functor over a predicate holding a null.
# Expect: rows T = [(1,)]
Src(x: 0);
Count(n? += 1) distinct :- Src(x:), x is null;
WithNull(x: null);
WithNull(x: 1);
T := Count(Src: WithNull);
