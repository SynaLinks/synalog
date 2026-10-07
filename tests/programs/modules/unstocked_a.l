# Products of letter a without stock.
# Expect: rows Q = []
import lib.shop.Product;
import lib.shop.Stock;
Q(sku:) :- Product(sku:), ~Stock(sku:), Substr(sku, 1, 1) == "a";
