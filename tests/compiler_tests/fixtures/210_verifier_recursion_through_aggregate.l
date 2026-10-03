# Test: Recursion through an aggregate is not stratified... but with @Recursive it is iterated. (from tests/programs/verifier/25_recursion_through_aggregate.l)

@Recursive(Count, 3);
Seed(n: 1);
Count(n? Max= n) distinct :- Seed(n:);
Count(n? Max= m + 1) distinct :- Count(n: m), m < 3;
