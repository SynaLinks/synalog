# Test: A functor aggregating (t? Max= x) over another predicate. (from tests/programs/fgrid/functor_02.l)

Src(x: 0);
Agg(t? Max= x) distinct :- Src(x:);
B(x:) :- x in [4, 5];
T0 := Agg(Src: B);
T(t:) :- T0(t:);
