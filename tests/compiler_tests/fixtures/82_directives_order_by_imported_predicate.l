# Test: Ordering an imported predicate, by its column. (from tests/programs/directives/18_order_by_imported_predicate.l)

import lib.numbers.Numbers;
@OrderBy(Numbers, "x");
Use(x:) :- Numbers(x:);
