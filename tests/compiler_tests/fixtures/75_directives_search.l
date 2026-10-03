# Test: search keeps the rows where a column matches the regular expression. (from tests/programs/directives/04_search.l)

@OrderBy(City, "name");
City(name: "rome", n: 1);
City(name: "paris", n: 2);
City(name: "oslo", n: 10);
