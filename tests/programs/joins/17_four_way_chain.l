# A chain of four joins.
# Expect: rows J = [(1, 4)]
E1(a: 1, b: 2);
E2(b: 2, c: 3);
E3(c: 3, d: 4);
J(a:, d:) :- E1(a:, b:), E2(b:, c:), E3(c:, d:);
