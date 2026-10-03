# Test: A constant argument filters. (from tests/programs/execution/44_constant_in_body.l)

Person(name: "ann", city: "paris");
Person(name: "bob", city: "rome");
Paris(name:) :- Person(name:, city: "paris");
