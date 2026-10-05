# A word equal to a single-quoted literal with an escape.
# Expect: rows Q = [(1,)]
W(id: 1, w: "it's");
W(id: 2, w: 'say "hi"');
W(id: 3, w: "café");
W(id: 4, w: "naïve");
W(id: 5, w: "a\b");
W(id: 6, w: "50%");
W(id: 7, w: "o'neil");
W(id: 8, w: "x_y");
Q(id:) :- W(id:, w:), w == 'it\'s';
