# Test: An imported generic total applied to local values. (from tests/programs/modules/functor_total.l)

import lib.stats.Total;
Mine(x: 4);
Mine(x: 9);
Mine(x: 1);
R := Total(Src: Mine);
