# Verifier Test: an unsafe Cast type name is refused.
# Expected Error: unsafeCastType
#
# (from tests/programs/injection/cast_type_statement.l)

Q(x:) :- x == Cast(1, "TEXT) AS x; DROP TABLE t; --");
