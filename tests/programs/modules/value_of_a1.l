# The stock value of a1.
# Expect: rows Q = [(200,)]
import lib.shop.Value;
Q(value:) :- Value(sku: "a1", value:);
