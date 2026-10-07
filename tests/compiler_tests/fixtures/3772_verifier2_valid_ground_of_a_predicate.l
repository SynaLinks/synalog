# Test: A program the verifier accepts: ground of a predicate. (from tests/programs/verifier2/valid_ground_of_a_predicate.l)

E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
@Ground(G);
G(n:) :- N(n:), n > 1;
Q(c? += 1) distinct :- G(n:);
