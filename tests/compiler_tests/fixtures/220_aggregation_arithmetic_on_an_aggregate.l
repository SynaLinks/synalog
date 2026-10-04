# Test: Computing with an aggregated value. (from tests/programs/aggregation/05_arithmetic_on_an_aggregate.l)

V(x:) :- x in [1, 2, 3];
T(t? += x) distinct :- V(x:);
D(d:) :- T(t:), d == t * 2;
