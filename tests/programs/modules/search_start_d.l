# Search '^d' over an import.
# Expect: search Q ^d = [('b2', 'desk')]
import lib.shop.Product;
@OrderBy(Q, "sku");
Q(sku:, name:) :- Product(sku:, name:);
