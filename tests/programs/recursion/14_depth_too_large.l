# A depth beyond what one script can hold: compile() refuses it, while synalog
# runs it, stopping when the recursion converges (here after 10 steps).
# Expect: compile-error Reach more steps than a SQL script can hold
# Expect: rows Reach = [(0,), (1,), (2,), (3,), (4,), (5,), (6,), (7,), (8,), (9,), (10,)]
Next(x:, y: x + 1) :- x in Range(10);
@Recursive(Reach, 5000);
@OrderBy(Reach, "y");
Reach(y: 0) distinct;
Reach(y:) distinct :- Reach(y: x), Next(x:, y:);
