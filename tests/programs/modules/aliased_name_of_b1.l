# The name of b1, through an alias.
# Expect: rows Q = [('lamp',)]
import lib.shop.Product as Item;
Q(name:) :- Item(sku: "b1", name:);
