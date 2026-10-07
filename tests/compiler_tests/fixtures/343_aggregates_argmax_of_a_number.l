# Test: ArgMax returning a number. (from tests/programs/aggregates/14_argmax_of_a_number.l)

V(id: 10, s: 1);
V(id: 30, s: 9);
V(id: 20, s: 5);
A(w? ArgMax= id -> s) distinct :- V(id:, s:);
