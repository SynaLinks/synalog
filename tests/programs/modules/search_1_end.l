# Search '1$' over an import.
# Expect: search Q 1$ = [('a1', 'pen'), ('b1', 'lamp'), ('c1', 'mug')]
import lib.shop.Product;
@OrderBy(Q, "sku");
Q(sku:, name:) :- Product(sku:, name:);
