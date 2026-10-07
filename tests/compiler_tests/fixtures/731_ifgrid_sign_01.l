# Test: The sign of -3 in words. (from tests/programs/ifgrid/sign_01.l)

V(x: -3);
C(w: (if x < 0 then "negative" else if x == 0 then "zero" else "positive")) :- V(x:);
