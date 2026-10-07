# Depth 99: exactly 99 steps.
# Expect: rows Far = [(99,)]
Next(x:, y: x + 1) :- x in Range(200);
@Recursive(Reach, 99);
Reach(y: 0) distinct;
Reach(y:) distinct :- Reach(y: x), Next(x:, y:);
Far(m? Max= y) distinct :- Reach(y:);
