# Verifier Test: v is aggregated but bound by nothing.
# Expected Error: SafetyError.unsafeAggregation
#
# (from tests/programs/verifier/04_unsafe_aggregation.l)

Item(x:) :- x in [1, 2];
Total(t? += v) distinct :- Item(x:);
