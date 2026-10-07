# A functor replaces the predicate a rule reads.
# Expect: rows D = [(2,), (4,)]
Src(x: 0);
Doubled(y: 2 * x) :- Src(x:);
Base(x:) :- x in [1, 2];
D := Doubled(Src: Base);
@OrderBy(D, "y");
