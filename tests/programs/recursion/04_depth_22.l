# Depth 22: exactly 22 steps.
# Expect: rows Far = [(22,)]
Next(x:, y: x + 1) :- x in Range(200);
@Recursive(Reach, 22);
Reach(y: 0) distinct;
Reach(y:) distinct :- Reach(y: x), Next(x:, y:);
Far(m? Max= y) distinct :- Reach(y:);
