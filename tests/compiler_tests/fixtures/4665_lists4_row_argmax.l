# Test: The position of each row's greatest element, from 0. (from tests/programs/lists4/row_argmax.l)

L(k: 1, l: [1, 2, 3]);
L(k: 2, l: []);
L(k: 3, l: [7]);
L(k: 4, l: [5, 5, 9, 1]);
L(k: 5, l: null);
@OrderBy(Q, "k");
Q(k:, v: (combine ArgMax= i -> Element(l, i) :- i in Range(Size(l)))) :- L(k:, l:);
