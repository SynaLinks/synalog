# Test: A rule of nulls and a rule of computed numbers, in one predicate. (from tests/programs/typing/union_of_null_rule_and_computed.l)

U(k: 1, v: null);
U(k: 2, v: 1 / 2);
@OrderBy(Q, "k");
Q(k:, v:) :- U(k:, v:);
