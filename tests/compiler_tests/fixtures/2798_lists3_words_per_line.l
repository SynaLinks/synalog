# Test: Words per line, the empty line has one empty word. (from tests/programs/lists3/words_per_line.l)

W(id: 1, s: "red green blue");
W(id: 2, s: "red red");
W(id: 3, s: "blue");
W(id: 4, s: "");
@OrderBy(Q, "id", "n");
Q(id:, n: Size(Split(s, " "))) :- W(id:, s:);
