# A record equal to a record built from its own field always holds.
# Expect: rows R = [(0,), (1,)]
V(x:) :- x in [0, 1];
@OrderBy(R, "x");
R(x:) :- V(x:), r == {a: x}, r == {a: r.a};
