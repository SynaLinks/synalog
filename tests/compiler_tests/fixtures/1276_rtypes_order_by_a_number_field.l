# Test: A number in a record is a number: 9 sorts before 10. (from tests/programs/rtypes/order_by_a_number_field.l)

R(r: {n: x}) :- x in [100, 9, 10];
@OrderBy(Q, "n");
Q(n: r.n) :- R(r:);
