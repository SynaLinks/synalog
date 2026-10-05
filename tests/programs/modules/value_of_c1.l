# The stock value of c1.
# Expect: rows Q = [(0,)]
import lib.shop.Value;
Q(value:) :- Value(sku: "c1", value:);
