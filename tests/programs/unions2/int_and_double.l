# A column given an integer by one rule and a double by another.
# Expect: rows Q = [(1, 2), (2, 2.5)]
U(k: 1, v: 2);
U(k: 2, v: 2.5);
@OrderBy(Q, "k");
Q(k:, v:) :- U(k:, v:);
