# Test: A generic applied to an imported predicate. (from tests/programs/modules/functor_of_imported_source.l)

import lib.stats.Total;
import lib.shop.Value;
V(x: value) :- Value(value:);
R := Total(Src: V);
