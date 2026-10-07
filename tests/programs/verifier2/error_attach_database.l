# Refused: attach database.
# Expect: error @AttachDatabase is not supported
E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
@AttachDatabase(x, "/tmp/x.db");
Q(n:) :- N(n:);
