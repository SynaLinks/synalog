# Words per first character, case kept.
# Expect: rows Q = [('1', 1), ('9', 1), ('A', 1), ('E', 1), ('Z', 1), ('a', 4), ('b', 1), ('z', 2), ('ä', 1), ('é', 1)]
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
@OrderBy(Q, "c", "n");
Q(c: Substr(w, 1, 1), n? += 1) distinct :- W(w:), Length(w) > 0;
