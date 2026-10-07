# Test: A join on a shared variable. (from tests/programs/execution/20_join.l)

Person(name: "ann", city_id: 1);
Person(name: "bob", city_id: 2);
City(city_id: 1, city: "paris");
City(city_id: 2, city: "rome");
City(city_id: 3, city: "oslo");
@OrderBy(Lives, "name");
Lives(name:, city:) :- Person(name:, city_id:), City(city_id:, city:);
