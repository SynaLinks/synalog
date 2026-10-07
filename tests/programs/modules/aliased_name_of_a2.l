# The name of a2, through an alias.
# Expect: rows Q = [('pad',)]
import lib.shop.Product as Item;
Q(name:) :- Item(sku: "a2", name:);
