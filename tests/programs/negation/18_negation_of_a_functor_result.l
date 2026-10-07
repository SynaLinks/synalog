# Negating the result of a functor.
# Expect: rows N = [(3,)]
Src(x: 0);
Kept(x:) :- Src(x:);
Base(x:) :- x in [1, 2];
K := Kept(Src: Base);
V(x:) :- x in [1, 2, 3];
N(x:) :- V(x:), ~K(x:);
