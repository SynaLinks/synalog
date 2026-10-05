# A functor aggregating (t? += 1) over another predicate.
# Expect: rows T = [(1,)]
Src(x: 0);
Agg(t? += 1) distinct :- Src(x:);
B(x:) :- x in [7];
T0 := Agg(Src: B);
T(t:) :- T0(t:);
