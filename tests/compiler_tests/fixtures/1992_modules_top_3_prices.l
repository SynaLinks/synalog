# Test: The 3 highest prices, ordered and limited over an import. (from tests/programs/modules/top_3_prices.l)

import lib.shop.Product;
@OrderBy(Q, "price desc");
@Limit(Q, 3);
Q(sku:, price:) :- Product(sku:, price:);
