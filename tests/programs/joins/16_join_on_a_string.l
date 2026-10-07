# Joining on a string column.
# Expect: rows J = [("fr", "paris")]
Country(code: "fr", name: "France");
City(code: "fr", city: "paris");
City(code: "de", city: "berlin");
J(code:, city:) :- Country(code:), City(code:, city:);
