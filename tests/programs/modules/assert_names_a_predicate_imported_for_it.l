# A local predicate whose assertion alone names a predicate of another
# file: imported for the assertion, it is checked, and it is a dependency.
# Expect: valid
# Expect: quiet
# Expect: holds Restock.stocked
# Expect: dependencies Restock = ['Product']
import lib.shop.Product;
@Assert(Restock, stocked: "∀ s, Restock s → ∃ n p, Product s n p");
@OrderBy(Restock, "sku");
Restock(sku:) :- sku in ["a1", "c1"];
