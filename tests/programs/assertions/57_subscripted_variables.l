# Lean identifiers with subscripts and primes.
# Expect: holds Price.key
@Assert(Price, key: "∀ i p₁ p', Price i p₁ → Price i p' → p₁ = p'");
Price(item: "x", price: 1);
Price(item: "y", price: 2);
