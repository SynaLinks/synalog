# Test: Counting rows per source of a union. (from tests/programs/unions/13_union_then_aggregate_per_source.l)

A(x:) :- x in [1, 2];
B(x: 3);
S(src: "a", x:) :- A(x:);
S(src: "b", x:) :- B(x:);
@OrderBy(U, "src");
U(src:, n? += 1) distinct :- S(src:, x:);
