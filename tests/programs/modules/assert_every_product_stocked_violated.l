# Not every product has stock.
# Expect: counterexamples Product.stocked = [('b2', 'desk', 120)]
import lib.shop.Product;
import lib.shop.Stock;
@Assert(Product, stocked: "∀ s n p, Product s n p → ∃ q, Stock s q");
