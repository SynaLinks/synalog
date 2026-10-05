# Search '^p' over an import.
# Expect: search Q ^p = [('a1', 'pen'), ('a2', 'pad')]
import lib.shop.Product;
@OrderBy(Q, "sku");
Q(sku:, name:) :- Product(sku:, name:);
