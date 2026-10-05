# A functor aggregating (t? Max= x) over another predicate.
# Expect: rows T = [(5,)]
Src(x: 0);
Agg(t? Max= x) distinct :- Src(x:);
B(x:) :- x in [4, 5];
T0 := Agg(Src: B);
T(t:) :- T0(t:);
