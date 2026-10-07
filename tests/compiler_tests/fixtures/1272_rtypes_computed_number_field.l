# Test: A computed number field sorts as a number. (from tests/programs/rtypes/computed_number_field.l)

R(r: {n: 2 * x}) :- x in [100, 9, 10];
@OrderBy(Q, "n");
Q(n: r.n) :- R(r:);
