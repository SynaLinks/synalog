# @Limit on a recursion computed into tables.
# Expect: rows R = [(25,), (24,)]
Next(x:, y: x + 1) :- x in Range(100);
@Recursive(R, 25);
@OrderBy(R, "y desc");
@Limit(R, 2);
R(y: 0) distinct;
R(y:) distinct :- R(y: x), Next(x:, y:);
