# The result of a functor is read like any predicate.
# Expect: rows T = [(6,)]
Src(x: 0);
Doubled(y: 2 * x) :- Src(x:);
Base(x:) :- x in [1, 2, 3];
D := Doubled(Src: Base);
T(y:) :- D(y:), y > 4;
