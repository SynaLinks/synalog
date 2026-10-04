# A report quotes the statement as it was written, whatever names imports gave
# the predicates it applies.
# Expect: holds Small.known
# Expect: statement Small.known = ∀ x, Small x → Numbers x
import lib.numbers.Numbers;
@Assert(Small, known: "∀ x, Small x → Numbers x");
Small(x:) :- Numbers(x:), x < 2;
