# Counting rows with an aggregate.
# Expect: rows N = [(3,)]
Item(x:) :- x in [1, 2, 3];
N(n? += 1) distinct :- Item();
