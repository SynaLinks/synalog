# A single step of recursion.
# Expect: rows R = [(0,), (1,)]
Next(x:, y: x + 1) :- x in Range(10);
@Recursive(R, 1);
@OrderBy(R, "y");
R(y: 0) distinct;
R(y:) distinct :- R(y: x), Next(x:, y:);
