# A functor of an aggregation, ordered.
# Expect: rows R = [("x", 4), ("y", 5)]
In0(g: "z", v: 0);
Total(g:, t? += v) distinct :- In0(g:, v:);
In1(g: "x", v: 1);
In1(g: "x", v: 3);
In1(g: "y", v: 5);
T1 := Total(In0: In1);
@OrderBy(R, "g");
R(g:, t:) :- T1(g:, t:);
