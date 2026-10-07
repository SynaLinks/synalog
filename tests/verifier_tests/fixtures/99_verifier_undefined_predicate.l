# Verifier Test: A misspelt predicate.
# Expected Error: UndefinedError.undefinedPredicate
#
# (from tests/programs/verifier/09_undefined_predicate.l)

Item(x:) :- x in [1, 2];
Total(x:) :- Itme(x:);
