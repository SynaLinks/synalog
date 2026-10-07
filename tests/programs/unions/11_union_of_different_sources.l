# A predicate fed by two different predicates.
# Expect: rows U = [("a",), ("b",), ("c",)]
A(s: "a");
B(t: "b");
B(t: "c");
@OrderBy(U, "s");
U(s:) :- A(s:);
U(s: t) :- B(t:);
