# Counting what a closure reaches, per source.
# Expect: rows C = [(1, 3), (2, 2), (3, 1)]
E(a: 1, b: 2);
E(a: 2, b: 3);
E(a: 3, b: 4);
@Recursive(Reach, 5);
Reach(s: a, t: b) distinct :- E(a:, b:);
Reach(s:, t: b) distinct :- Reach(s:, t: a), E(a:, b:);
@OrderBy(C, "s");
C(s:, n? += 1) distinct :- Reach(s:);
