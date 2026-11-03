# A distinct recursion over rows holding null: a row found again is the same
# row, null or not, so each row is found once.
# Expect: rows R = [(1, None), (2, None), (3, None)]
@Recursive(R, 30);
@OrderBy(R, "x");
R(x: 1, y: ToInt64(null)) distinct;
R(x: 2, y:) distinct :- R(x:, y:), x == 1;
R(x: 3, y:) distinct :- R(x:, y:), x == 2;
