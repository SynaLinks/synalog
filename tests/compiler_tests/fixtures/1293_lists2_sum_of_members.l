# Test: The sum of each list's members. (from tests/programs/lists2/sum_of_members.l)

L(id: 1, l: [3, 1, 2]);
L(id: 2, l: []);
L(id: 3, l: [5]);
L(id: 4, l: [7, 7, 8, 9]);
@OrderBy(Q, "id", "s");
Q(id:, s? += x) distinct :- L(id:, l:), x in l;
