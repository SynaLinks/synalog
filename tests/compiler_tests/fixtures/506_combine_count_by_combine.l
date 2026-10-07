# Test: Counting with a combine expression. (from tests/programs/combine/04_count_by_combine.l)

V(x:) :- x in [5, 6, 7];
T(n:) :- n == (combine += 1 :- V(x:));
