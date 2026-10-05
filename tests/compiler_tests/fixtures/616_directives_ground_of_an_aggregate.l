# Test: A grounded aggregate read twice. (from tests/programs/directives/35_ground_of_an_aggregate.l)

V(x:) :- x in [1, 2];
@Ground(T);
T(t? += x) distinct :- V(x:);
J(a:, b:) :- T(t: a), T(t: b);
