# The sum of list 2, null when empty.
# Expect: rows Q = [(None,)]
L(k: 1, l: [1, 2, 3]);
L(k: 2, l: []);
L(k: 3, l: [7]);
L(k: 4, l: [5, 5, 9, 1]);
Q(s? += x) distinct :- L(k: 2, l:), x in l;
