# Test: A text reversed twice is itself; null stays null. (from tests/programs/text2/reverse_twice.l)

W(k: 1, s: "naïve");
W(k: 2, s: "");
W(k: 3, s: null);
@OrderBy(Q, "k");
Q(k:, v: Reverse(Reverse(s)), r: Reverse(s)) :- W(k:, s:);
