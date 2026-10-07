# Test: A list collected from no rows, without a group, is null or empty. (from tests/programs/empty/06_list_of_nothing.l)

V(x:) :- x in [1], x > 5;
C(l? List= x) distinct :- V(x:);
L(n: Coalesce(Size(l), 0)) :- C(l:);
