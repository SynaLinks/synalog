# Verifier Test: Refused: function as condition.
# Expected Error: SafetyError.functionAsCondition
#
# (from tests/programs/verifier2/error_function_as_condition.l)

E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
Big(x) = x > 1;
Q(a:) :- E(a:), Big(a);
