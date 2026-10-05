# A small shop: products, stock, and what they are worth.
# Expect: holds Price.positive
Product(sku: "a1", name: "pen", price: 2);
Product(sku: "a2", name: "pad", price: 5);
Product(sku: "b1", name: "lamp", price: 30);
Product(sku: "b2", name: "desk", price: 120);
Product(sku: "c1", name: "mug", price: 8);
Stock(sku: "a1", qty: 100);
Stock(sku: "a2", qty: 40);
Stock(sku: "b1", qty: 3);
Stock(sku: "c1", qty: 0);
Value(sku:, value: price * qty) :- Product(sku:, price:), Stock(sku:, qty:);
Cheap(sku:) :- Product(sku:, price:), price < 10;
Price(sku:, price:) :- Product(sku:, price:);
@Assert(Price, positive: "∀ s, Price s > 0");
