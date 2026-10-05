# Test: An imported generic maximum applied to local values. (from tests/programs/modules/functor_largest.l)

import lib.stats.Largest;
Mine(x: 4);
Mine(x: 9);
Mine(x: 1);
R := Largest(Src: Mine);
