# Test: The comparison written with the function on the left. (from tests/programs/selfref/upper_on_the_left.l)

C(id: 1, last: "Ab");
C(id: 2, last: "AB");
U(id:) :- C(id:, last:), Upper(last) == last;
