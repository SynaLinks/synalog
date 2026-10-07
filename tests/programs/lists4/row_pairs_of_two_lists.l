# Sums of pairs from a row's list and a second list, counted when above 8.
# Expect: rows Q = [(1, 1), (2, None), (3, 2), (4, 4), (5, None)]
L(k: 1, l: [1, 2, 3]);
L(k: 2, l: []);
L(k: 3, l: [7]);
L(k: 4, l: [5, 5, 9, 1]);
L(k: 5, l: null);
@OrderBy(Q, "k");
Q(k:, v: (combine += 1 :- a in l, b in [3, 6], a + b > 8)) :- L(k:, l:);
