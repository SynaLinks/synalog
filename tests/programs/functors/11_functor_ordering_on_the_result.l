# Ordering the result of a functor.
# Expect: rows D = [(4,), (2,)]
Src(x: 0);
Doubled(y: 2 * x) :- Src(x:);
Base(x:) :- x in [1, 2];
D := Doubled(Src: Base);
@OrderBy(D, "y desc");
