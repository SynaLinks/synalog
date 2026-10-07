# Test: A join of three predicates. (from tests/programs/joins/01_three_way.l)

P(name: "ann", city: "paris");
C(city: "paris", country: "fr");
K(country: "fr");
J(name:, city:, country:) :- P(name:, city:), C(city:, country:), K(country:);
