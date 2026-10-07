# The last element of each list joined with [0].
# Expect: rows Q = [(1, 0), (2, 0), (3, 0), (4, 0)]
L(k: 1, l: [1, 2, 3]);
L(k: 2, l: []);
L(k: 3, l: [7]);
L(k: 4, l: [5, 5, 9, 1]);
@OrderBy(Q, "k");
Q(k:, v: Element(ArrayConcat(l, [0]), Size(ArrayConcat(l, [0])) - 1)) :- L(k:, l:);
