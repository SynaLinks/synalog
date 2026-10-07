# A program the verifier accepts: flag value defined.
# Expect: valid
# Expect: rows Q = [(1,), (2,)]
E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
@OrderBy(Q, "n");
@DefineFlag("lim", "2");
Q(n:) :- N(n:), n <= ToInt64(FlagValue("lim"));
