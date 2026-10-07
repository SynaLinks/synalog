# Test: A deep recursive predicate read by two rules. (from tests/programs/recursion/06_deep_recursion_used_twice.l)

Next(x:, y: x + 1) :- x in Range(100);
@Recursive(Reach, 21);
Reach(y: 0) distinct;
Reach(y:) distinct :- Reach(y: x), Next(x:, y:);
Far(m? Max= y) distinct :- Reach(y:);
Count(n? += 1) distinct :- Reach();
Both(m:, n:) :- Far(m:), Count(n:);
