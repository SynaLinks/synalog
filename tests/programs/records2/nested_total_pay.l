# The sum of two fields of a nested record.
# Expect: rows Q = [('ann', 13000), ('bob', 9400), ('cid', 7200), ('dan', 6800), ('eve', 11200), ('fay', 4600), ('gus', 8000), ('hal', 17200)]
Emp(name: "ann", dept: "eng", salary: 7000, city: "paris");
Emp(name: "bob", dept: "eng", salary: 5200, city: "lyon");
Emp(name: "cid", dept: "ops", salary: 4100, city: "paris");
Emp(name: "dan", dept: "ops", salary: 3900, city: "nice");
Emp(name: "eve", dept: "sales", salary: 6100, city: "lyon");
Emp(name: "fay", dept: "sales", salary: 2800, city: "paris");
Emp(name: "gus", dept: "hr", salary: 4500, city: "nice");
Emp(name: "hal", dept: "eng", salary: 9100, city: "nice");
Nest(name:, r: {pay: {base: salary, bonus: salary - 1000}, place: {city:, dept:}}) :-
  Emp(name:, dept:, salary:, city:);
@OrderBy(Q, "name", "total");
Q(name:, total: r.pay.base + r.pay.bonus) :- Nest(name:, r:);
