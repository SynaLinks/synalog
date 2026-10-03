# A predicate imported from another file.
# Expect: rows Doubled = [(2,), (4,)]
import lib.numbers.Numbers;
@OrderBy(Doubled, "y");
Doubled(y: 2 * x) :- Numbers(x:);
