# Test: Whole numbers divided by 7: computed doubles, the same text everywhere. (from tests/programs/numtext/sevenths.l)

W(n: 1);
W(n: 22);
W(n: 100);
W(n: 355);
W(n: 1000000);
W(n: 123456789);
@OrderBy(Q, "n");
Q(n:, t: ToString(n / 7)) :- W(n:);
