# v is aggregated but bound by nothing.
# Expect: error Unsafe aggregation

Item(x:) :- x in [1, 2];
Total(t? += v) distinct :- Item(x:);
