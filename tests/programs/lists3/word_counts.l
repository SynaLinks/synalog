# How often each word appears.
# Expect: rows Q = [('blue', 2), ('green', 1), ('red', 3)]
W(id: 1, s: "red green blue");
W(id: 2, s: "red red");
W(id: 3, s: "blue");
W(id: 4, s: "");
@OrderBy(Q, "w", "n");
Q(w:, n? += 1) distinct :- W(s:), w in Split(s, " "), w != "";
