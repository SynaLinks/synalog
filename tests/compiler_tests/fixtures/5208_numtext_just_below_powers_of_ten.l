# Test: Numbers just below a power of ten: their digits are counted, not taken from a logarithm. (from tests/programs/numtext/just_below_powers_of_ten.l)

V(k: 0, x: 999999999999999.4);
V(k: 1, x: 99999999999999.95);
V(k: 2, x: 0.0999999999999999);
V(k: 3, x: 9999.999999999998);
@OrderBy(Q, "k");
Q(k:, t: ToString(x)) :- V(k:, x:);
