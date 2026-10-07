# Test: Keyword columns through an iterated recursion. (from tests/programs/keywords/12_keyword_column_in_deep_recursion.l)

Next(from:, to: from + 1) :- from in Range(100);
@Recursive(Reach, 25);
Reach(to: 0) distinct;
Reach(to:) distinct :- Reach(to: x), Next(from: x, to:);
Far(m? Max= to) distinct :- Reach(to:);
