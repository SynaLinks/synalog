# Test: A boolean variable as a condition holds where it is true. (from tests/programs/logic/bare_boolean.l)

V(x: 1, b: true, s: "ab");
V(x: 2, b: false, s: "ba");
V(x: 3, b: null, s: null);
Q(x:) :- V(x:, b:), b;
