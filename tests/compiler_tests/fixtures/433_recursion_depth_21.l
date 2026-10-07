# Test: The first depth computed into tables. (from tests/programs/recursion/33_depth_21.l)

Next(x:, y: x + 1) :- x in Range(100);
@Recursive(Reach, 21);
Reach(y: 0) distinct;
Reach(y:) distinct :- Reach(y: x), Next(x:, y:);
R(m? Max= y) distinct :- Reach(y:);
