# Words split on the apostrophe.
# Expect: rows Q = [('it',), ('neil',), ('o',), ('s',)]
W(id: 1, w: "it's");
W(id: 2, w: 'say "hi"');
W(id: 3, w: "café");
W(id: 4, w: "naïve");
W(id: 5, w: "a\b");
W(id: 6, w: "50%");
W(id: 7, w: "o'neil");
W(id: 8, w: "x_y");
@OrderBy(Q, "part");
Q(part:) distinct :- W(w:), Like(w, "%'%"), part in Split(w, "'");
