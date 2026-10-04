# Verifier Test: An error names an imported predicate as it was written, not with the prefix
# Expected Error: AssertionError.invalidAssertion
#
# its import gives it.
# (from tests/programs/assertions/81_error_names_an_imported_predicate_as_written.l)

import tests.verifier_tests.fixtures.lib.numbers.Numbers;
@Assert(Small, known: "∀ x y, Small x → Numbers x y");
Small(x:) :- Numbers(x:), x < 2;
