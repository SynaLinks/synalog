# Test: Two predicates of one file, joined. (from tests/programs/modules/two_imports_one_file.l)

import lib.shop.Product;
import lib.shop.Stock;
@OrderBy(Q, "name", "qty");
Q(name:, qty:) :- Product(sku:, name:), Stock(sku:, qty:);
