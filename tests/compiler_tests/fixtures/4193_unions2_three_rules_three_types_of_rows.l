# Test: Three rules: a constant, a computed value, a joined value. (from tests/programs/unions2/three_rules_three_types_of_rows.l)

J(k: 3, v: 30);
U(k: 1, v: 10);
U(k: 2, v: 2 * 10);
U(k:, v:) :- J(k:, v:);
@OrderBy(Q, "k");
Q(k:, v:) :- U(k:, v:);
