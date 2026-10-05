# Search '[0-9]' over an import.
# Expect: search Q [0-9] = [('a1', 'pen'), ('a2', 'pad'), ('b1', 'lamp'), ('b2', 'desk'), ('c1', 'mug')]
import lib.shop.Product;
@OrderBy(Q, "sku");
Q(sku:, name:) :- Product(sku:, name:);
