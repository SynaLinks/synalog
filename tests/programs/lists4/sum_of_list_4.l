# The sum of list 4, null when empty.
# Expect: rows Q = [(20,)]
L(k: 1, l: [1, 2, 3]);
L(k: 2, l: []);
L(k: 3, l: [7]);
L(k: 4, l: [5, 5, 9, 1]);
Q(s? += x) distinct :- L(k: 4, l:), x in l;
