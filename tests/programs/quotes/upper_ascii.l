# Upper case of ASCII words.
# Expect: rows Q = [(1, "IT'S"), (2, 'SAY "HI"'), (5, 'A\\B'), (6, '50%'), (7, "O'NEIL"), (8, 'X_Y')]
W(id: 1, w: "it's");
W(id: 2, w: 'say "hi"');
W(id: 3, w: "café");
W(id: 4, w: "naïve");
W(id: 5, w: "a\b");
W(id: 6, w: "50%");
W(id: 7, w: "o'neil");
W(id: 8, w: "x_y");
@OrderBy(Q, "id", "u");
Q(id:, u: Upper(w)) :- W(id:, w:), id != 3, id != 4;
