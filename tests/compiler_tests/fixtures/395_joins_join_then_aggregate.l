# Test: Joining three predicates, then aggregating. (from tests/programs/joins/12_join_then_aggregate.l)

City(c: "paris", country: "fr");
City(c: "lyon", country: "fr");
Shop(s: 1, c: "paris");
Shop(s: 2, c: "lyon");
Sale(s: 1, amount: 10);
Sale(s: 2, amount: 20);
J(country:, t? += amount) distinct :- City(c:, country:), Shop(s:, c:), Sale(s:, amount:);
