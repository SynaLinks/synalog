# Test: The 2 highest prices, ordered and limited over an import. (from tests/programs/modules/top_2_prices.l)

import lib.shop.Product;
@OrderBy(Q, "price desc");
@Limit(Q, 2);
Q(sku:, price:) :- Product(sku:, price:);
