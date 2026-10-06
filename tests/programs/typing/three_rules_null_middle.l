# Three rules giving a column: a number, a null, a number.
# Expect: rows Q = [(1, 1.5), (2, None), (3, 2)]
U(k: 1, v: 1.5);
U(k: 2, v: null);
U(k: 3, v: 2);
@OrderBy(Q, "k");
Q(k:, v:) :- U(k:, v:);
