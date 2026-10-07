# An imported generic total applied to local values.
# Expect: rows R = [(14,)]
import lib.stats.Total;
Mine(x: 4);
Mine(x: 9);
Mine(x: 1);
R := Total(Src: Mine);
