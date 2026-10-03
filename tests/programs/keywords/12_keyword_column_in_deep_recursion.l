# Keyword columns through an iterated recursion.
# Expect: rows Far = [(25,)]
Next(from:, to: from + 1) :- from in Range(100);
@Recursive(Reach, 25);
Reach(to: 0) distinct;
Reach(to:) distinct :- Reach(to: x), Next(from: x, to:);
Far(m? Max= to) distinct :- Reach(to:);
