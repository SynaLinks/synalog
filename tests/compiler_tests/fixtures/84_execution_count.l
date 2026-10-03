# Test: Counting rows with an aggregate. (from tests/programs/execution/01_count.l)

Item(x:) :- x in [1, 2, 3];
N(n? += 1) distinct :- Item();
