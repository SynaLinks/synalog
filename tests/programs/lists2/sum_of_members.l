# The sum of each list's members.
# Expect: rows Q = [(1, 6), (3, 5), (4, 31)]
L(id: 1, l: [3, 1, 2]);
L(id: 2, l: []);
L(id: 3, l: [5]);
L(id: 4, l: [7, 7, 8, 9]);
@OrderBy(Q, "id", "s");
Q(id:, s? += x) distinct :- L(id:, l:), x in l;
