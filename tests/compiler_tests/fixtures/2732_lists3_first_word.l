# Test: The first word of each line. (from tests/programs/lists3/first_word.l)

W(id: 1, s: "red green blue");
W(id: 2, s: "red red");
W(id: 3, s: "blue");
W(id: 4, s: "");
@OrderBy(Q, "id", "w");
Q(id:, w: Element(Split(s, " "), 0)) :- W(id:, s:);
