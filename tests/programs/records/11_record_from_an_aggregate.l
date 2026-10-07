# A record holding aggregates.
# Expect: rows R = [(1, 3)]
V(x:) :- x in [1, 2, 3];
S(lo? Min= x, hi? Max= x) distinct :- V(x:);
W(r: {lo:, hi:}) :- S(lo:, hi:);
R(lo: r.lo, hi: r.hi) :- W(r:);
