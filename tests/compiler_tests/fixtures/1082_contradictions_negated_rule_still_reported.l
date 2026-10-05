# Test: The contradictory rule is reported even when only used under a negation. (from tests/programs/contradictions/negated_rule_still_reported.l)

V(x:) :- x in [1, 2];
Bad(x:) :- V(x:), x > 5, x < 3;
@OrderBy(C, "x");
C(x:) :- V(x:), ~Bad(x:);
