# Test: Rows whose list holds nothing above 4: a negation over a row's list. (from tests/programs/lists4/row_negated_membership.l)

L(k: 1, l: [1, 2, 3]);
L(k: 2, l: []);
L(k: 3, l: [7]);
L(k: 4, l: [5, 5, 9, 1]);
L(k: 5, l: null);
@OrderBy(Q, "k");
Q(k:) :- L(k:, l:), ~(y in l, y > 4);
