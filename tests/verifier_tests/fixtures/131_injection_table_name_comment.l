# Verifier Test: A table name holds no comment.
# Expected Error: UndefinedError.undefinedPredicate
#
# (from tests/programs/injection/table_name_comment.l)

Q(x:) :- Users--x(x:);
