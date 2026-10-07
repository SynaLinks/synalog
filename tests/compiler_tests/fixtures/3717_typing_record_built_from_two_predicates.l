# Test: A record built from the columns of two predicates. (from tests/programs/typing/record_built_from_two_predicates.l)

A(k: 1, n: "a");
B(k: 1, v: 10);
C(r: {n:, v:}) :- A(k:, n:), B(k:, v:);
Q(n: r.n, v: r.v) :- C(r:);
