# Search 'mug' over an import.
# Expect: search Q mug = [('c1', 'mug')]
import lib.shop.Product;
@OrderBy(Q, "sku");
Q(sku:, name:) :- Product(sku:, name:);
