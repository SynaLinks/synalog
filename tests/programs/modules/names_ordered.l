# Names in order, from an import.
# Expect: rows Q = [('desk',), ('lamp',), ('mug',), ('pad',), ('pen',)]
import lib.shop.Product;
@OrderBy(Q, "name");
Q(name:) :- Product(name:);
