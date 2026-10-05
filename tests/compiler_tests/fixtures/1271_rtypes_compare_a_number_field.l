# Test: A number field compares as a number: 10 > 9. (from tests/programs/rtypes/compare_a_number_field.l)

R(r: {n: x}) :- x in [100, 9, 10];
@OrderBy(Q, "n");
Q(n: r.n) :- R(r:), r.n > 9;
