# An assertion about an imported predicate.
# Expect: holds Product.key
import lib.shop.Product;
@Assert(Product, key: "∀ s n m p q, Product s n p → Product s m q → n = m ∧ p = q");
