# A constant argument filters.
# Expect: rows Paris = [("ann",)]
Person(name: "ann", city: "paris");
Person(name: "bob", city: "rome");
Paris(name:) :- Person(name:, city: "paris");
