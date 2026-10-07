# Test: The values equal to 2.5: an integer equals its double. (from tests/programs/numbers3/d_equal_to_2_5.l)

X(k: 1, x: 7);
X(k: 2, x: -7);
X(k: 3, x: 2.5);
X(k: 4, x: -2.5);
X(k: 5, x: 0);
X(k: 6, x: null);
X(k: 7, x: 0.1);
X(k: 8, x: -0.75);
@OrderBy(Q, "k");
Q(k:) :- X(k:, x:), x == 2.5;
