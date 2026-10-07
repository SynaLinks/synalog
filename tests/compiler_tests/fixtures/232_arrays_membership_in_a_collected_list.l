# Test: Membership in a list held by a predicate. (from tests/programs/arrays/05_membership_in_a_collected_list.l)

V(x:) :- x in [1, 2, 3];
Wanted(w:) :- w in [1, 3];
L(l? List= w) distinct :- Wanted(w:);
@OrderBy(X, "x");
X(x:) :- V(x:), L(l:), x in l;
