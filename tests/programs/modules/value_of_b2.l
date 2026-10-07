# The stock value of b2.
# Expect: rows Q = []
import lib.shop.Value;
Q(value:) :- Value(sku: "b2", value:);
