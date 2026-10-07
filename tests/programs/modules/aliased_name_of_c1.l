# The name of c1, through an alias.
# Expect: rows Q = [('mug',)]
import lib.shop.Product as Item;
Q(name:) :- Item(sku: "c1", name:);
