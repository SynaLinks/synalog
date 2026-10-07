# Test: Products with no stock row, a negation of an import. (from tests/programs/modules/not_in_stock.l)

import lib.shop.Product;
import lib.shop.Stock;
Q(sku:) :- Product(sku:), ~Stock(sku:);
