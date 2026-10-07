# Test: Whole numbers above 10^15 keep all their digits. (from tests/programs/numtext/whole_above_1e15.l)

V(k: 0, x: 9999999999999998.0);
V(k: 1, x: 1500000000000000.0);
V(k: 2, x: 4503599627370497.0);
V(k: 3, x: -9007199254740991.0);
@OrderBy(Q, "k");
Q(k:, t: ToString(x)) :- V(k:, x:);
