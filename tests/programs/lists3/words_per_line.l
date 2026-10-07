# Words per line, the empty line has one empty word.
# Expect: rows Q = [(1, 3), (2, 2), (3, 1), (4, 1)]
W(id: 1, s: "red green blue");
W(id: 2, s: "red red");
W(id: 3, s: "blue");
W(id: 4, s: "");
@OrderBy(Q, "id", "n");
Q(id:, n: Size(Split(s, " "))) :- W(id:, s:);
