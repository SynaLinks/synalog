# Test: The 1 highest prices, ordered and limited over an import. (from tests/programs/modules/top_1_prices.l)

import lib.shop.Product;
@OrderBy(Q, "price desc");
@Limit(Q, 1);
Q(sku:, price:) :- Product(sku:, price:);
