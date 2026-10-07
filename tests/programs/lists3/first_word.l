# The first word of each line.
# Expect: rows Q = [(1, 'red'), (2, 'red'), (3, 'blue'), (4, '')]
W(id: 1, s: "red green blue");
W(id: 2, s: "red red");
W(id: 3, s: "blue");
W(id: 4, s: "");
@OrderBy(Q, "id", "w");
Q(id:, w: Element(Split(s, " "), 0)) :- W(id:, s:);
