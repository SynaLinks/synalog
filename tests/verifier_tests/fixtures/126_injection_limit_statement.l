# Verifier Test: @Limit takes a number of rows.
# Expected Error: DirectiveError.invalidDirective
#
# (from tests/programs/injection/limit_statement.l)

V(x: 1);
@Limit(Q, "1; DROP TABLE t");
Q(x:) :- V(x:);
