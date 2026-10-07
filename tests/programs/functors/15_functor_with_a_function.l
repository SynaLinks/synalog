# A functor of a rule using a function.
# Expect: rows R = [(1,), (4,)]
Sq(x) = x * x;
Src(x: 0);
Squares(y: Sq(x)) :- Src(x:);
Base(x:) :- x in [1, 2];
S := Squares(Src: Base);
@OrderBy(R, "y");
R(y:) :- S(y:);
