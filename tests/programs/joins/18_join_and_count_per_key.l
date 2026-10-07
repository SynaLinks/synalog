# Counting the matches of each key.
# Expect: rows J = [(1, 2), (2, 1)]
K(k:) :- k in [1, 2];
M(k: 1);
M(k: 1);
M(k: 2);
@OrderBy(J, "k");
J(k:, n? += 1) distinct :- K(k:), M(k:);
