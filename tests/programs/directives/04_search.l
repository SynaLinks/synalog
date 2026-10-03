# search keeps the rows where a column matches the regular expression.
# Expect: search City ^pa = [("paris", 2)]
# Expect: search City 1 = [("oslo", 10), ("rome", 1)]
@OrderBy(City, "name");
City(name: "rome", n: 1);
City(name: "paris", n: 2);
City(name: "oslo", n: 10);
