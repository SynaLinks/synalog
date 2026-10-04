# A union without distinct keeps duplicates.
# Expect: rows N = [(4,)]
U(x:) :- x in [1, 2];
U(x:) :- x in [2, 3];
N(n? += 1) distinct :- U();
