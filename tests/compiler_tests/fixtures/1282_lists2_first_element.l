# Test: The first element of non-empty lists. (from tests/programs/lists2/first_element.l)

L(id: 1, l: [3, 1, 2]);
L(id: 2, l: []);
L(id: 3, l: [5]);
L(id: 4, l: [7, 7, 8, 9]);
@OrderBy(Q, "id", "x");
Q(id:, x: Element(l, 0)) :- L(id:, l:), Size(l) > 0;
