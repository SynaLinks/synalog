# Test: The distinct values of list 4. (from tests/programs/lists4/distinct_count_4.l)

L(k: 1, l: [1, 2, 3]);
L(k: 2, l: []);
L(k: 3, l: [7]);
L(k: 4, l: [5, 5, 9, 1]);
Q(n? Count= x) distinct :- L(k: 4, l:), x in l;
