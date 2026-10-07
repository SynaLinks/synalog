# Test: Membership in a list collected by an aggregate. (from tests/programs/membership/02_in_a_collected_list.l)

A(x:) :- x in [1, 3];
B(x:) :- x in [3, 5];
L(l? List= x) distinct :- B(x:);
M(x:) :- A(x:), L(l:), x in l;
