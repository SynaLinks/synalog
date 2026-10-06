# A boolean variable as a condition holds where it is true.
# Expect: rows Q = [(1,)]
V(x: 1, b: true, s: "ab");
V(x: 2, b: false, s: "ba");
V(x: 3, b: null, s: null);
Q(x:) :- V(x:, b:), b;
