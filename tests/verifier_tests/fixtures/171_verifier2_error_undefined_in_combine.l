# Verifier Test: Refused: undefined in combine.
# Expected Error: UndefinedError.undefinedPredicate
#
# (from tests/programs/verifier2/error_undefined_in_combine.l)

E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
Q(n:, c: (combine += 1 :- Nope(a: n))) :- N(n:);
