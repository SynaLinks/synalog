# Every item is cheap or expensive.
# Expect: holds Item.priced

@Assert(Item, priced: "∀ i p, Item i p → p < 10 ∨ p ≥ 10");
Item(name: "a", price: 3);
Item(name: "b", price: 30);
