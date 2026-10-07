# A conditional on a conjunction and a disjunction.
# Expect: rows C = [(1, 0), (2, 1), (3, 1), (10, 1)]
V(x:) :- x in [1, 2, 3, 10];
@OrderBy(C, "x");
C(x:, y: (if (x > 1 && x < 4) || x == 10 then 1 else 0)) :- V(x:);
