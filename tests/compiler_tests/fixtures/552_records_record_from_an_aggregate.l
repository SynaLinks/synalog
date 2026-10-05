# Test: A record holding aggregates. (from tests/programs/records/11_record_from_an_aggregate.l)

V(x:) :- x in [1, 2, 3];
S(lo? Min= x, hi? Max= x) distinct :- V(x:);
W(r: {lo:, hi:}) :- S(lo:, hi:);
R(lo: r.lo, hi: r.hi) :- W(r:);
