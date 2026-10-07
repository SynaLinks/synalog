# Refused: copy to file.
# Expect: error copy_to_file is not supported
E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
@Ground(Q, copy_to_file: "/tmp/x");
Q(n:) :- N(n:);
