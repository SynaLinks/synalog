# Search '^a' over an import.
# Expect: search Q ^a = [('a1', 'pen'), ('a2', 'pad')]
import lib.shop.Product;
@OrderBy(Q, "sku");
Q(sku:, name:) :- Product(sku:, name:);
