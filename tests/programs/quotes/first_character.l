# The first character.
# Expect: rows Q = [(1, 'i'), (2, 's'), (3, 'c'), (4, 'n'), (5, 'a'), (6, '5'), (7, 'o'), (8, 'x')]
W(id: 1, w: "it's");
W(id: 2, w: 'say "hi"');
W(id: 3, w: "café");
W(id: 4, w: "naïve");
W(id: 5, w: "a\b");
W(id: 6, w: "50%");
W(id: 7, w: "o'neil");
W(id: 8, w: "x_y");
@OrderBy(Q, "id", "c");
Q(id:, c: Substr(w, 1, 1)) :- W(id:, w:);
