# A generic applied to an imported predicate.
# Expect: rows R = [(490,)]
import lib.stats.Total;
import lib.shop.Value;
V(x: value) :- Value(value:);
R := Total(Src: V);
