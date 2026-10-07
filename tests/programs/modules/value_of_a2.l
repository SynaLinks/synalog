# The stock value of a2.
# Expect: rows Q = [(200,)]
import lib.shop.Value;
Q(value:) :- Value(sku: "a2", value:);
