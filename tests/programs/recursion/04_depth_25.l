# Depth 25: exactly 25 steps.
# Expect: rows Far = [(25,)]
Next(x:, y: x + 1) :- x in Range(200);
@Recursive(Reach, 25);
Reach(y: 0) distinct;
Reach(y:) distinct :- Reach(y: x), Next(x:, y:);
Far(m? Max= y) distinct :- Reach(y:);
