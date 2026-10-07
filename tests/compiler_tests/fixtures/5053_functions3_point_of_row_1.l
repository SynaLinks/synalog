# Test: The record a function builds for row 1. (from tests/programs/functions3/point_of_row_1.l)

Sq(x) = x * x;
Clamp(x, lo, hi) = Greatest(lo, Least(x, hi));
Sgn(x) = (if x > 0 then 1 else if x < 0 then -1 else 0);
Inc(x) = n :- n == x + 1;
Twice(x) = Inc(Inc(x)) - 2 + x;
Hyp(a, b) = Sqrt(Sq(a) + Sq(b));
RateOf(s) = r :- Rate(s:, r:);
Label(x) = (if x is null then "none" else ToString(x));
Pt(x) = {x:, y: Sq(x)};
Firsts(l) = Element(l, 0);
V(k: 1, x: 3, s: "ab");
V(k: 2, x: -4, s: "hello");
V(k: 3, x: 0, s: "");
V(k: 4, x: null, s: "x");
V(k: 5, x: 12, s: null);
V(k: 6, x: 7, s: "seven");
Rate(s: "ab", r: 2);
Rate(s: "hello", r: 5);
Rate(s: "x", r: 10);
Q(a: p.x, b: p.y) :- V(k: 1, x:), p == Pt(x);
