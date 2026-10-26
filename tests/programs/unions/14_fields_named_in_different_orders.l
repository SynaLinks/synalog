# Rules naming a predicate's fields in different orders: each value stays in
# its field, whatever the order the rule writes them in.
# Expect: rows Q = [(1, 2), (4, 3), (6, 5)]
P(a: 1, b: 2);
P(b: 3, a: 4);
P(b: 5, a: 6) :- 1 == 1;
@OrderBy(Q, "a");
Q(a:, b:) :- P(a:, b:);
