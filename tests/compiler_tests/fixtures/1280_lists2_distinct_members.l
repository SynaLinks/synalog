# Test: The distinct members. (from tests/programs/lists2/distinct_members.l)

L(id: 1, l: [3, 1, 2]);
L(id: 2, l: []);
L(id: 3, l: [5]);
L(id: 4, l: [7, 7, 8, 9]);
@OrderBy(Q, "x");
Q(x:) distinct :- L(l:), x in l;
