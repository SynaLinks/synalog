# Search 'e$' over an import.
# Expect: search Q e$ = []
import lib.shop.Product;
@OrderBy(Q, "sku");
Q(sku:, name:) :- Product(sku:, name:);
