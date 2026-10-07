# A field three records deep.
# Expect: rows Q = [('ann', 7000), ('eve', 6100), ('hal', 9100)]
Emp(name: "ann", dept: "eng", salary: 7000, city: "paris");
Emp(name: "bob", dept: "eng", salary: 5200, city: "lyon");
Emp(name: "cid", dept: "ops", salary: 4100, city: "paris");
Emp(name: "dan", dept: "ops", salary: 3900, city: "nice");
Emp(name: "eve", dept: "sales", salary: 6100, city: "lyon");
Emp(name: "fay", dept: "sales", salary: 2800, city: "paris");
Emp(name: "gus", dept: "hr", salary: 4500, city: "nice");
Emp(name: "hal", dept: "eng", salary: 9100, city: "nice");
D(name:, r: {a: {b: {c: salary}}}) :- Emp(name:, salary:);
@OrderBy(Q, "name", "c");
Q(name:, c: r.a.b.c) :- D(name:, r:), r.a.b.c > 6000;
