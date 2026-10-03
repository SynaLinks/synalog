# An assertion about an imported predicate, reported under its imported name.
# Expect: holds Numbers_Numbers.positive
import lib.numbers.Numbers;
@Assert(Numbers, positive: "∀ x, Numbers x → x > 0");
Use(x:) :- Numbers(x:);
