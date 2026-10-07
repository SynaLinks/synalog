# Test: x % -3, the remainder taking the sign of x. (from tests/programs/math2/remainder_minus3.l)

V(id: 1, x: 7);
V(id: 2, x: -7);
V(id: 3, x: 2.5);
V(id: 4, x: -2.5);
V(id: 5, x: 0);
V(id: 6, x: 3);
V(id: 7, x: 0.125);
V(id: 8, x: 1000000);
V(id: 9, x: -0.75);
V(id: 10, x: 12.345);
@OrderBy(Q, "id");
Q(id:, v: x % -3) :- V(id:, x:), Floor(x) == x;
