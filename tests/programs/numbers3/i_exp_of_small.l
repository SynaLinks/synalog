# The exponential of the values under 10 in size.
# Expect: rows Q = [(3, 54.598150033144236), (4, 1.0), (7, 0.36787944117144233), (8, 8103.083927575384)]
X(k: 1, x: 17);
X(k: 2, x: -17);
X(k: 3, x: 4);
X(k: 4, x: 0);
X(k: 5, x: null);
X(k: 6, x: 3000000000);
X(k: 7, x: -1);
X(k: 8, x: 9);
@OrderBy(Q, "k");
Q(k:, v: Exp(x)) :- X(k:, x:), Abs(x) < 10;
