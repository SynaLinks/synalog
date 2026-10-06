# Test: An empty list and a list of texts in one column. (from tests/programs/typing/empty_list_then_texts.l)

V(k: 1, l: []);
V(k: 2, l: ["a", "b"]);
@OrderBy(Q, "k");
Q(k:, n: Size(l)) :- V(k:, l:);
