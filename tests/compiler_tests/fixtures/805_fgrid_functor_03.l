# Test: A functor aggregating (t? += 1) over another predicate. (from tests/programs/fgrid/functor_03.l)

Src(x: 0);
Agg(t? += 1) distinct :- Src(x:);
B(x:) :- x in [7];
T0 := Agg(Src: B);
T(t:) :- T0(t:);
