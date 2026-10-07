# A function returning a record, read by field.
# Expect: rows Q = [('dan', 7800), ('fay', 5600)]
Emp(name: "ann", dept: "eng", salary: 7000, city: "paris");
Emp(name: "bob", dept: "eng", salary: 5200, city: "lyon");
Emp(name: "cid", dept: "ops", salary: 4100, city: "paris");
Emp(name: "dan", dept: "ops", salary: 3900, city: "nice");
Emp(name: "eve", dept: "sales", salary: 6100, city: "lyon");
Emp(name: "fay", dept: "sales", salary: 2800, city: "paris");
Emp(name: "gus", dept: "hr", salary: 4500, city: "nice");
Emp(name: "hal", dept: "eng", salary: 9100, city: "nice");
Pay(s) = {now: s, next: s * 2};
@OrderBy(Q, "name", "next");
Q(name:, next: Pay(salary).next) :- Emp(name:, salary:), salary < 4000;
