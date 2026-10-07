# Test: Numbers between 10^14 and 10^15 keep 15 significant digits, no decimal. (from tests/programs/numtext/between_1e14_and_1e15.l)

V(k: 0, x: 123456789012345.67);
V(k: 1, x: 999999999999999.4);
V(k: 2, x: 999999999999999.6);
V(k: 3, x: -314159265358979.3);
@OrderBy(Q, "k");
Q(k:, t: ToString(x)) :- V(k:, x:);
