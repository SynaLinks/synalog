# A boolean field of a record.
# Expect: rows Q = [('ann',), ('eve',), ('hal',)]
Emp(name: "ann", dept: "eng", salary: 7000, city: "paris");
Emp(name: "bob", dept: "eng", salary: 5200, city: "lyon");
Emp(name: "cid", dept: "ops", salary: 4100, city: "paris");
Emp(name: "dan", dept: "ops", salary: 3900, city: "nice");
Emp(name: "eve", dept: "sales", salary: 6100, city: "lyon");
Emp(name: "fay", dept: "sales", salary: 2800, city: "paris");
Emp(name: "gus", dept: "hr", salary: 4500, city: "nice");
Emp(name: "hal", dept: "eng", salary: 9100, city: "nice");
S(name:, r: {senior: salary >= 6000}) :- Emp(name:, salary:);
@OrderBy(Q, "name");
Q(name:) :- S(name:, r:), r.senior == true;
