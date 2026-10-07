# The name of a1, through an alias.
# Expect: rows Q = [('pen',)]
import lib.shop.Product as Item;
Q(name:) :- Item(sku: "a1", name:);
