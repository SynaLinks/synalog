# An imported generic maximum applied to local values.
# Expect: rows R = [(9,)]
import lib.stats.Largest;
Mine(x: 4);
Mine(x: 9);
Mine(x: 1);
R := Largest(Src: Mine);
