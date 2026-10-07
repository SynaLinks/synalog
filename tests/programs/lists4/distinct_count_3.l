# The distinct values of list 3.
# Expect: rows Q = [(1,)]
L(k: 1, l: [1, 2, 3]);
L(k: 2, l: []);
L(k: 3, l: [7]);
L(k: 4, l: [5, 5, 9, 1]);
Q(n? Count= x) distinct :- L(k: 3, l:), x in l;
