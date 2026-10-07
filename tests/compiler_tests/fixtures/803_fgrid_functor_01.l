# Test: A functor aggregating (t? += x) over another predicate. (from tests/programs/fgrid/functor_01.l)

Src(x: 0);
Agg(t? += x) distinct :- Src(x:);
B(x:) :- x in [1, 2, 3];
T0 := Agg(Src: B);
T(t:) :- T0(t:);
