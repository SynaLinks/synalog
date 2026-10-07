# Test: (a, b) | c in a body. (from tests/programs/execution/50_disjunction_of_conjunctions.l)

V(x:) :- x in [1, 2, 3, 4];
@OrderBy(Pick, "x");
Pick(x:) :- V(x:), ((x > 0, x < 2) | x == 4);
