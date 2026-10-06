# Test: An empty list concatenated with a list of texts from another predicate. (from tests/programs/typing/empty_list_concat_texts.l)

A(l: []);
B(l: ["a", "b"]);
Q(n: Size(ArrayConcat(a, b))) :- A(l: a), B(l: b);
