# Verifier Test: SQL inside an @OrderBy item
# Expected Error: DirectiveError.invalidDirective
#
# Each @OrderBy item lands in ORDER BY: anything but a column is raw SQL.

# ERROR: not a column
@OrderBy(V, "x; DROP TABLE t");
V(x:) :- x in [1, 2];
