# Test: Array= collects values ordered by a key. (from tests/programs/aggregates/15_array_ordered.l)

V(k: 3, v: "c");
V(k: 1, v: "a");
V(k: 2, v: "b");
A(l? Array= k -> v) distinct :- V(k:, v:);
