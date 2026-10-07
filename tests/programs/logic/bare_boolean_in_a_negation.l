# A boolean variable as a condition inside a negation.
# Expect: rows Q = [(2,), (3,)]
V(x: 1, b: true, s: "ab");
V(x: 2, b: false, s: "ba");
V(x: 3, b: null, s: null);
@OrderBy(Q, "x");
Q(x:) :- V(x:), ~(V(x:, b:), b);
