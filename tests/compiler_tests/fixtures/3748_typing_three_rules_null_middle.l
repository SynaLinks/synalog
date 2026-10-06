# Test: Three rules giving a column: a number, a null, a number. (from tests/programs/typing/three_rules_null_middle.l)

U(k: 1, v: 1.5);
U(k: 2, v: null);
U(k: 3, v: 2);
@OrderBy(Q, "k");
Q(k:, v:) :- U(k:, v:);
