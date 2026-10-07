# The salaries in ops, as numbers.
# Expect: rows Q = [(3900,), (4100,)]
Emp(name: "ann", dept: "eng", salary: 7000, city: "paris");
Emp(name: "bob", dept: "eng", salary: 5200, city: "lyon");
Emp(name: "cid", dept: "ops", salary: 4100, city: "paris");
Emp(name: "dan", dept: "ops", salary: 3900, city: "nice");
Emp(name: "eve", dept: "sales", salary: 6100, city: "lyon");
Emp(name: "fay", dept: "sales", salary: 2800, city: "paris");
Emp(name: "gus", dept: "hr", salary: 4500, city: "nice");
Emp(name: "hal", dept: "eng", salary: 9100, city: "nice");
Rec(name:, r: {dept:, salary:, city:}) :- Emp(name:, dept:, salary:, city:);
@OrderBy(Q, "salary");
Q(salary: r.salary) :- Rec(r:), r.dept == "ops";
