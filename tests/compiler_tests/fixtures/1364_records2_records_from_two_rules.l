# Test: A predicate whose records come from two rules. (from tests/programs/records2/records_from_two_rules.l)

Emp(name: "ann", dept: "eng", salary: 7000, city: "paris");
Emp(name: "bob", dept: "eng", salary: 5200, city: "lyon");
Emp(name: "cid", dept: "ops", salary: 4100, city: "paris");
Emp(name: "dan", dept: "ops", salary: 3900, city: "nice");
Emp(name: "eve", dept: "sales", salary: 6100, city: "lyon");
Emp(name: "fay", dept: "sales", salary: 2800, city: "paris");
Emp(name: "gus", dept: "hr", salary: 4500, city: "nice");
Emp(name: "hal", dept: "eng", salary: 9100, city: "nice");
T(name:, r: {tag: city}) :- Emp(name:, dept: "sales", city:);
T(name:, r: {tag: dept}) :- Emp(name:, dept:, salary:), salary > 9000;
@OrderBy(Q, "name", "tag");
Q(name:, tag: r.tag) :- T(name:, r:);
