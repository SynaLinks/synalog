# Search '^[bc]' over an import.
# Expect: search Q ^[bc] = [('b1', 'lamp'), ('b2', 'desk'), ('c1', 'mug')]
import lib.shop.Product;
@OrderBy(Q, "sku");
Q(sku:, name:) :- Product(sku:, name:);
