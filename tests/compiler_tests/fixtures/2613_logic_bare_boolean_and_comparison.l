# Test: With another condition. (from tests/programs/logic/bare_boolean_and_comparison.l)

V(x: 1, b: true, s: "ab");
V(x: 2, b: false, s: "ba");
V(x: 3, b: null, s: null);
Q(x:) :- V(x:, b:), b, x > 1;
