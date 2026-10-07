# Ordering an imported predicate, by its column.
# Expect: valid
import lib.numbers.Numbers;
@OrderBy(Numbers, "x");
Use(x:) :- Numbers(x:);
