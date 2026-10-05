# Numbers as text sort as text.
# Expect: rows Q = [('100',), ('12',), ('3',)]
V(n: 3);
V(n: 12);
V(n: 100);
@OrderBy(Q, "s");
Q(s: ToString(n)) :- V(n:);
