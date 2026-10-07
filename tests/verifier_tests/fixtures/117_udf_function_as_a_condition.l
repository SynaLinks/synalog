# Verifier Test: A function written as a condition holds whatever its value: refused.
# Expected Error: SafetyError.functionAsCondition
#
# (from tests/programs/udf/14_function_as_a_condition.l)

IsEven(x) = (x % 2 == 0);
V(x:) :- x in [1, 2, 3, 4];
E(x:) :- V(x:), IsEven(x);
