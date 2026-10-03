# A deep recursive predicate read by two rules.
# Expect: rows Both = [(30, 31)]
Next(x:, y: x + 1) :- x in Range(100);
@Recursive(Reach, 30);
Reach(y: 0) distinct;
Reach(y:) distinct :- Reach(y: x), Next(x:, y:);
Far(m? Max= y) distinct :- Reach(y:);
Count(n? += 1) distinct :- Reach();
Both(m:, n:) :- Far(m:), Count(n:);
