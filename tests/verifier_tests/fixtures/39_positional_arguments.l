# Verifier Test: Positional arguments where named are required
# Expected Error: positionalArguments
#
# Synalog uses named arguments only. Positional arguments compile to synthetic
# col0, col1, ... column names that do not match real database schemas, so the
# verifier rejects them in rule heads and body predicate references. (Function
# calls and annotations legitimately use positional arguments and are exempt.)

Customer(id, name) :- customers(id:, name:);
