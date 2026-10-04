# Test: Negating an aggregated predicate. (from tests/programs/negation/04_negation_of_an_aggregate.l)

R(k: "a", v: 10);
R(k: "b", v: 1);
Loud(k:) distinct :- R(k:, v:), v > 5;
K(k:) distinct :- R(k:);
@OrderBy(Quiet, "k");
Quiet(k:) :- K(k:), ~Loud(k:);
