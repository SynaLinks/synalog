# Test: An ordered list of records, its first element read two predicates later. (from tests/programs/typing/list_of_records_array_ordered.l)

V(k: 2, n: "a");
V(k: 1, n: "b");
L(l? Array= k -> {n:}) distinct :- V(k:, n:);
M(l:) :- L(l:);
Q(n: Element(l, 0).n) :- M(l:);
