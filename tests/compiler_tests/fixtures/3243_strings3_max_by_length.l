# Test: The length of the longest word, in characters. (from tests/programs/strings3/max_by_length.l)

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
Q(n? Max= Length(w)) distinct :- W(w:);
