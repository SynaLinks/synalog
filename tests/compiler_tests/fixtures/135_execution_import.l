# Test: A predicate imported from another file. (from tests/programs/execution/52_import.l)

import lib.numbers.Numbers;
@OrderBy(Doubled, "y");
Doubled(y: 2 * x) :- Numbers(x:);
