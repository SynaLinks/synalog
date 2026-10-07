# Test: Local facts joined with an import. (from tests/programs/modules/local_and_imported.l)

import lib.shop.Product;
Color(sku: "a1", color: "red");
Color(sku: "c1", color: "red");
@OrderBy(Q, "name", "color");
Q(name:, color:) :- Product(sku:, name:), Color(sku:, color:);
