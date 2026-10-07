# A boolean variable as one branch of a disjunction.
# Expect: rows Q = [(1,), (3,)]
V(x: 1, b: true, s: "ab");
V(x: 2, b: false, s: "ba");
V(x: 3, b: null, s: null);
@OrderBy(Q, "x");
Q(x:) distinct :- V(x:, b:), (b | x == 3);
