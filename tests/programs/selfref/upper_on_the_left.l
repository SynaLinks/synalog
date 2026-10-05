# The comparison written with the function on the left.
# Expect: rows U = [(2,)]
C(id: 1, last: "Ab");
C(id: 2, last: "AB");
U(id:) :- C(id:, last:), Upper(last) == last;
