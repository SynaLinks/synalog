# Test: The size of a collected list. (from tests/programs/lists2/collected_size.l)

L(id: 1, l: [3, 1, 2]);
L(id: 2, l: []);
L(id: 3, l: [5]);
L(id: 4, l: [7, 7, 8, 9]);
All(xs? List= x) distinct :- L(l:), x in l;
Q(n: Size(xs)) :- All(xs:);
