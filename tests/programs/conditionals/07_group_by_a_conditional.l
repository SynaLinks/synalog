# Grouping by the value of a conditional.
# Expect: rows C = [("big", 2), ("small", 3)]
V(x:) :- x in [1, 2, 3, 10, 20];
@OrderBy(C, "size");
C(size: (if x > 5 then "big" else "small"), n? += 1) distinct :- V(x:);
