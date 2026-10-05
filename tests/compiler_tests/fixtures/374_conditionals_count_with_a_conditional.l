# Test: Counting the rows a condition holds for. (from tests/programs/conditionals/03_count_with_a_conditional.l)

V(x:) :- x in [1, 2, 3, 4];
C(n? += (if x > 2 then 1 else 0)) distinct :- V(x:);
