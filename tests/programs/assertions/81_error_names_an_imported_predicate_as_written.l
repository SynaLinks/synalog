# An error names an imported predicate as it was written, not with the prefix
# its import gives it.
# Expect: error 'Numbers' has 1 column (x) but is applied to 2 arguments
import lib.numbers.Numbers;
@Assert(Small, known: "∀ x y, Small x → Numbers x y");
Small(x:) :- Numbers(x:), x < 2;
