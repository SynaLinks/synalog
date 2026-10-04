# Verifier Test: An imported predicate applied to the wrong number of arguments
# Expected Error: AssertionError.invalidAssertion
#
# An import renames the predicates it brings in, inside statements too: the
# statement still names `Numbers`, which has one column (x) and is applied to two.

import tests.verifier_tests.fixtures.lib.numbers.Numbers;

@Assert(Small, known: "∀ x y, Small x → Numbers x y");
Small(x:) :- Numbers(x:), x < 2;
