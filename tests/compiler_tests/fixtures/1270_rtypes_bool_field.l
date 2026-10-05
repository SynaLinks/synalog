# Test: A comparison in a record is a boolean. (from tests/programs/rtypes/bool_field.l)

R(r: {n: x, big: x > 9}) :- x in [10, 9];
Q(n: r.n) :- R(r:), r.big == true;
