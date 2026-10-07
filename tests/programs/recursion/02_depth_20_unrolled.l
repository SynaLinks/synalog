# Depth 20, the last unrolled one.
# Expect: rows Far = [(20,)]
Next(x:, y: x + 1) :- x in Range(100);
@Recursive(Reach, 20);
Reach(y: 0) distinct;
Reach(y:) distinct :- Reach(y: x), Next(x:, y:);
Far(m? Max= y) distinct :- Reach(y:);
