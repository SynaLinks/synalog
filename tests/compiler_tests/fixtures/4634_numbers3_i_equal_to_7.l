# Test: The values equal to 7: an integer equals its double. (from tests/programs/numbers3/i_equal_to_7.l)

X(k: 1, x: 17);
X(k: 2, x: -17);
X(k: 3, x: 4);
X(k: 4, x: 0);
X(k: 5, x: null);
X(k: 6, x: 3000000000);
X(k: 7, x: -1);
X(k: 8, x: 9);
@OrderBy(Q, "k");
Q(k:) :- X(k:, x:), x == 7;
