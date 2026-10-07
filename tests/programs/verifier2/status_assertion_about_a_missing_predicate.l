# An assertion about a predicate not yet written waits for it.
# Expect: status Q.other pending
E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
Q(n:) :- N(n:);
@Assert(Q, other: "∀ n, Zz n → n > 0");
