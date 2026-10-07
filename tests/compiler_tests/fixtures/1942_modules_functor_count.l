# Test: An imported generic count applied to local values. (from tests/programs/modules/functor_count.l)

import lib.stats.Count;
Mine(x: 4);
Mine(x: 9);
Mine(x: 1);
R := Count(Src: Mine);
