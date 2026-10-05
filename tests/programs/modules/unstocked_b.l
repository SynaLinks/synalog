# Products of letter b without stock.
# Expect: rows Q = [('b2',)]
import lib.shop.Product;
import lib.shop.Stock;
Q(sku:) :- Product(sku:), ~Stock(sku:), Substr(sku, 1, 1) == "b";
