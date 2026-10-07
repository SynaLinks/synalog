# An imported generic count applied to local values.
# Expect: rows R = [(3,)]
import lib.stats.Count;
Mine(x: 4);
Mine(x: 9);
Mine(x: 1);
R := Count(Src: Mine);
