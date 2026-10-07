# Test: Coalesce of strings. (from tests/programs/nulls/16_coalesce_strings.l)

V(s: null);
N(v: Coalesce(s, "fallback")) :- V(s:);
