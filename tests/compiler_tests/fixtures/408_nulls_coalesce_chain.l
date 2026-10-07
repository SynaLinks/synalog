# Test: The first non-null of several. (from tests/programs/nulls/09_coalesce_chain.l)

V(a: null, b: null, c: 3);
N(v: Coalesce(a, b, c)) :- V(a:, b:, c:);
