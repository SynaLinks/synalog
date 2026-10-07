# Test: Grouping by the value of a conditional. (from tests/programs/conditionals/07_group_by_a_conditional.l)

V(x:) :- x in [1, 2, 3, 10, 20];
@OrderBy(C, "size");
C(size: (if x > 5 then "big" else "small"), n? += 1) distinct :- V(x:);
