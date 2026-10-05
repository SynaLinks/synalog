# Search 'p' over an import.
# Expect: search Q p = [('a1', 'pen'), ('a2', 'pad'), ('b1', 'lamp')]
import lib.shop.Product;
@OrderBy(Q, "sku");
Q(sku:, name:) :- Product(sku:, name:);
