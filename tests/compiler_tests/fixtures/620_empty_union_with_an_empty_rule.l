# Test: A rule with no rows adds nothing to a union. (from tests/programs/empty/04_union_with_an_empty_rule.l)

U(x: 1);
U(x:) :- x in [2], x > 5;
