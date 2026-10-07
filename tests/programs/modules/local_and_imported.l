# Local facts joined with an import.
# Expect: rows Q = [('mug', 'red'), ('pen', 'red')]
import lib.shop.Product;
Color(sku: "a1", color: "red");
Color(sku: "c1", color: "red");
@OrderBy(Q, "name", "color");
Q(name:, color:) :- Product(sku:, name:), Color(sku:, color:);
