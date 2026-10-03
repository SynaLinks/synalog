# A join on a shared variable.
# Expect: rows Lives = [("ann", "paris"), ("bob", "rome")]
Person(name: "ann", city_id: 1);
Person(name: "bob", city_id: 2);
City(city_id: 1, city: "paris");
City(city_id: 2, city: "rome");
City(city_id: 3, city: "oslo");
@OrderBy(Lives, "name");
Lives(name:, city:) :- Person(name:, city_id:), City(city_id:, city:);
