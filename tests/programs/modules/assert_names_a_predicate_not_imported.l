# The same assertion without the import: nothing defines Product here, so
# the assertion waits for it, never checked, and the verifier says so.
# Expect: valid
# Expect: status Restock.stocked pending
# Expect: warning Assertion 'Restock.stocked' names Product, which nothing defines or imports
# Expect: dependencies Restock = ['Product']
@Assert(Restock, stocked: "∀ s, Restock s → ∃ n p, Product s n p");
@OrderBy(Restock, "sku");
Restock(sku:) :- sku in ["a1", "c1"];
