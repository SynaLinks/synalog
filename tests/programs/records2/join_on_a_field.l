# A record's field joins another table.
# Expect: rows Q = [('ann', 3), ('bob', 3), ('cid', 1), ('dan', 1), ('eve', 2), ('fay', 2), ('gus', 1), ('hal', 3)]
Emp(name: "ann", dept: "eng", salary: 7000, city: "paris");
Emp(name: "bob", dept: "eng", salary: 5200, city: "lyon");
Emp(name: "cid", dept: "ops", salary: 4100, city: "paris");
Emp(name: "dan", dept: "ops", salary: 3900, city: "nice");
Emp(name: "eve", dept: "sales", salary: 6100, city: "lyon");
Emp(name: "fay", dept: "sales", salary: 2800, city: "paris");
Emp(name: "gus", dept: "hr", salary: 4500, city: "nice");
Emp(name: "hal", dept: "eng", salary: 9100, city: "nice");
Floor(dept: "eng", floor: 3);
Floor(dept: "ops", floor: 1);
Floor(dept: "sales", floor: 2);
Floor(dept: "hr", floor: 1);
Rec(name:, r: {dept:, salary:, city:}) :- Emp(name:, dept:, salary:, city:);
@OrderBy(Q, "name", "floor");
Q(name:, floor:) :- Rec(name:, r:), Floor(dept: r.dept, floor:);
