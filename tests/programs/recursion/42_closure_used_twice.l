# A closure read twice in one rule.
# Expect: rows T = [(1, 3)]
E(a: 1, b: 2);
E(a: 2, b: 3);
@Recursive(P, 5);
P(a:, b:) distinct :- E(a:, b:);
P(a:, b: c) distinct :- P(a:, b:), E(a: b, b: c);
T(a:, c:) :- P(a:, b:), P(a: b, b: c);
