# Test: Counting the nulls of a typed column. (from tests/programs/typing/count_of_typed_nulls.l)

V(k: 1, v: null);
V(k: 2, v: 7);
V(k: 3, v: null);
Q(n? += (if v is null then 1 else 0)) distinct :- V(v:);
