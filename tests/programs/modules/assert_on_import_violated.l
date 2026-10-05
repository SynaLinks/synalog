# An assertion about an import, violated.
# Expect: counterexamples Product.cheap = [('b2', 'desk', 120)]
import lib.shop.Product;
@Assert(Product, cheap: "∀ s n p, Product s n p → p < 100");
