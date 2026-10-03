# Depth 50: exactly 50 steps.
# Expect: rows Far = [(50,)]
Next(x:, y: x + 1) :- x in Range(200);
@Recursive(Reach, 50);
Reach(y: 0) distinct;
Reach(y:) distinct :- Reach(y: x), Next(x:, y:);
Far(m? Max= y) distinct :- Reach(y:);
