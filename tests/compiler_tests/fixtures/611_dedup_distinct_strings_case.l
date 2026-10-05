# Test: distinct keeps rows differing in case. (from tests/programs/dedup/08_distinct_strings_case.l)

V(s:) :- s in ["a", "A", "a"];
@OrderBy(D, "s");
D(s:) distinct :- V(s:);
