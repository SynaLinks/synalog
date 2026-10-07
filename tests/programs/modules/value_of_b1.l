# The stock value of b1.
# Expect: rows Q = [(90,)]
import lib.shop.Value;
Q(value:) :- Value(sku: "b1", value:);
