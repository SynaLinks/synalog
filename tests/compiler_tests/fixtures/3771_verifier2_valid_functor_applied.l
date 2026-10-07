# Test: A program the verifier accepts: functor applied. (from tests/programs/verifier2/valid_functor_applied.l)

E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
Src(n: 0);
Tot(t? += n) distinct :- Src(n:);
Only(n:) :- N(n:), n > 1;
Q := Tot(Src: Only);
