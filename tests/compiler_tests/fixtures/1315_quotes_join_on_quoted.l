# Test: Words with quotes join. (from tests/programs/quotes/join_on_quoted.l)

W(id: 1, w: "it's");
W(id: 2, w: 'say "hi"');
W(id: 3, w: "café");
W(id: 4, w: "naïve");
W(id: 5, w: "a\b");
W(id: 6, w: "50%");
W(id: 7, w: "o'neil");
W(id: 8, w: "x_y");
Kind(w: "it's", kind: "apostrophe");
Kind(w: "o'neil", kind: "apostrophe");
@OrderBy(Q, "id", "kind");
Q(id:, kind:) :- W(id:, w:), Kind(w:, kind:);
