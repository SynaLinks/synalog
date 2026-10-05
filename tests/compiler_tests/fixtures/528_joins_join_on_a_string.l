# Test: Joining on a string column. (from tests/programs/joins/16_join_on_a_string.l)

Country(code: "fr", name: "France");
City(code: "fr", city: "paris");
City(code: "de", city: "berlin");
J(code:, city:) :- Country(code:), City(code:, city:);
