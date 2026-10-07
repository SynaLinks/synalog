# Test: A program the verifier accepts: flag value defined. (from tests/programs/verifier2/valid_flag_value_defined.l)

E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
@OrderBy(Q, "n");
@DefineFlag("lim", "2");
Q(n:) :- N(n:), n <= ToInt64(FlagValue("lim"));
