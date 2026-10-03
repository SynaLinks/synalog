# An odd depth past 20: exactly 41 steps.
# Expect: rows Far = [(41,)]
Next(x:, y: x + 1) :- x in Range(100);
@Recursive(Reach, 41);
Reach(y: 0) distinct;
Reach(y:) distinct :- Reach(y: x), Next(x:, y:);
Far(m? Max= y) distinct :- Reach(y:);
