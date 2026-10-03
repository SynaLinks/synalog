# Every item is cheap or expensive; the mid-priced one is neither.
# Expect: counterexamples Item.priced = [("b", 30)]
@Assert(Item, priced: "∀ i p, Item i p → p < 10 ∨ p > 100");
Item(name: "a", price: 3);
Item(name: "b", price: 30);
Item(name: "c", price: 300);
