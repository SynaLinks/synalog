# A functor aggregating (t? += x) over another predicate.
# Expect: rows T = [(6,)]
Src(x: 0);
Agg(t? += x) distinct :- Src(x:);
B(x:) :- x in [1, 2, 3];
T0 := Agg(Src: B);
T(t:) :- T0(t:);
