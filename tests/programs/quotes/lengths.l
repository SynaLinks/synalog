# Lengths count characters.
# Expect: rows Q = [(1, 4), (2, 8), (3, 4), (4, 5), (5, 3), (6, 3), (7, 6), (8, 3)]
W(id: 1, w: "it's");
W(id: 2, w: 'say "hi"');
W(id: 3, w: "café");
W(id: 4, w: "naïve");
W(id: 5, w: "a\b");
W(id: 6, w: "50%");
W(id: 7, w: "o'neil");
W(id: 8, w: "x_y");
@OrderBy(Q, "id", "n");
Q(id:, n: Length(w)) :- W(id:, w:);
