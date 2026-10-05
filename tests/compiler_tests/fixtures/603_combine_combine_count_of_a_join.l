# Test: Counting a join by a combine. (from tests/programs/combine/11_combine_count_of_a_join.l)

A(k:) :- k in [1, 2, 3];
B(k:) :- k in [2, 3, 4];
T(n:) :- n == (combine += 1 :- A(k:), B(k:));
