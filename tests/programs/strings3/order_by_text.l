# Text in code point order: upper case before lower, digits before letters.
# Expect: rows Q = [('', 13), ('10', 8), ('9', 9), ('Apple', 2), ('Eclair', 7), ('Zebra', 4), ('a b', 10), ('a-b', 11), ('a_b', 12), ('apple', 1), ('banana', 3), ('z', 15), ('zebra', 5), ('ä', 14), ('éclair', 6)]
W(id: 1, w: "apple");
W(id: 2, w: "Apple");
W(id: 3, w: "banana");
W(id: 4, w: "Zebra");
W(id: 5, w: "zebra");
W(id: 6, w: "éclair");
W(id: 7, w: "Eclair");
W(id: 8, w: "10");
W(id: 9, w: "9");
W(id: 10, w: "a b");
W(id: 11, w: "a-b");
W(id: 12, w: "a_b");
W(id: 13, w: "");
W(id: 14, w: "ä");
W(id: 15, w: "z");
@OrderBy(Q, "w", "id");
Q(w:, id:) :- W(id:, w:);
