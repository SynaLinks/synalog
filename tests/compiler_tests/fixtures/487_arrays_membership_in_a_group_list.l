# Test: Membership in each group's list. (from tests/programs/arrays/21_membership_in_a_group_list.l)

V(g: "a", x: 1);
V(g: "a", x: 2);
V(g: "b", x: 3);
L(g:, l? List= x) distinct :- V(g:, x:);
A(g:) :- L(g:, l:), 2 in l;
