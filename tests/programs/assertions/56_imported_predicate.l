# An assertion about an imported predicate, reported under the name it was written with.
# Expect: holds Numbers.positive
import lib.numbers.Numbers;
@Assert(Numbers, positive: "∀ x, Numbers x → x > 0");
Use(x:) :- Numbers(x:);
