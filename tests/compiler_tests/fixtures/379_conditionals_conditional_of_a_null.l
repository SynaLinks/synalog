# Test: A condition on a null is not true: the else branch. (from tests/programs/conditionals/08_conditional_of_a_null.l)

V(x: null);
C(w: (if x > 0 then "yes" else "no")) :- V(x:);
