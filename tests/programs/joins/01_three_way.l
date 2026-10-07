# A join of three predicates.
# Expect: rows J = [("ann", "paris", "fr")]
P(name: "ann", city: "paris");
C(city: "paris", country: "fr");
K(country: "fr");
J(name:, city:, country:) :- P(name:, city:), C(city:, country:), K(country:);
