# The name of b2, through an alias.
# Expect: rows Q = [('desk',)]
import lib.shop.Product as Item;
Q(name:) :- Item(sku: "b2", name:);
