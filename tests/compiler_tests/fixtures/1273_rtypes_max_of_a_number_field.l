# Test: The largest number field, as a number. (from tests/programs/rtypes/max_of_a_number_field.l)

R(r: {n: x}) :- x in [100, 9, 10];
M(m? Max= r.n) distinct :- R(r:);
