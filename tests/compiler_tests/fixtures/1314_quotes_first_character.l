# Test: The first character. (from tests/programs/quotes/first_character.l)

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
