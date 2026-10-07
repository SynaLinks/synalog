# Three rules: a constant, a computed value, a joined value.
# Expect: rows Q = [(1, 10), (2, 20), (3, 30)]
J(k: 3, v: 30);
U(k: 1, v: 10);
U(k: 2, v: 2 * 10);
U(k:, v:) :- J(k:, v:);
@OrderBy(Q, "k");
Q(k:, v:) :- U(k:, v:);
