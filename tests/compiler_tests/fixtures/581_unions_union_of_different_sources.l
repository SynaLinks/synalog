# Test: A predicate fed by two different predicates. (from tests/programs/unions/11_union_of_different_sources.l)

A(s: "a");
B(t: "b");
B(t: "c");
@OrderBy(U, "s");
U(s:) :- A(s:);
U(s: t) :- B(t:);
