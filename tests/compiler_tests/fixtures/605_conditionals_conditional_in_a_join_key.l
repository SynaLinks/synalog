# Test: Joining on a conditional value. (from tests/programs/conditionals/10_conditional_in_a_join_key.l)

V(x:) :- x in [1, 2];
Name(p: 0, n: "even");
Name(p: 1, n: "odd");
@OrderBy(C, "x");
C(x:, n:) :- V(x:), Name(p: (if x % 2 == 0 then 0 else 1), n:);
