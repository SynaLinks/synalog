# Every stock row is of a product.
# Expect: holds Stock.known
import lib.shop.Product;
import lib.shop.Stock;
@Assert(Stock, known: "∀ s q, Stock s q → ∃ n p, Product s n p");
