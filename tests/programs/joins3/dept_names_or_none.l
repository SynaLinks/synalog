# Each employee's department name, or "none": a left join with two rules.
# Expect: rows Q = [('ann', 'eng'), ('bob', 'eng'), ('cid', 'ops'), ('dee', 'none'), ('eve', 'none'), ('fay', 'ops')]
E(id: 1, name: "ann", dept: 10, boss: null);
E(id: 2, name: "bob", dept: 10, boss: 1);
E(id: 3, name: "cid", dept: 20, boss: 1);
E(id: 4, name: "dee", dept: null, boss: 2);
E(id: 5, name: "eve", dept: 30, boss: 3);
E(id: 6, name: "fay", dept: 20, boss: null);
D(dept: 10, dname: "eng", city: "paris");
D(dept: 20, dname: "ops", city: "lyon");
D(dept: 40, dname: "hr", city: "nice");
D(dept: null, dname: "temp", city: "lyon");
Pr(pid: 100, dept: 10);
Pr(pid: 101, dept: 10);
Pr(pid: 102, dept: 20);
Pr(pid: 103, dept: 50);
S(id: 1, skill: "sql");
S(id: 1, skill: "go");
S(id: 2, skill: "sql");
S(id: 3, skill: "rust");
S(id: 5, skill: "sql");
S(id: 5, skill: "go");
S(id: 6, skill: "excel");
@OrderBy(Q, "name", "dname");
Q(name:, dname:) :- E(name:, dept:), D(dept:, dname:);
Has(name:) :- E(name:, dept:), D(dept:);
Q(name:, dname: "none") :- E(name:), ~Has(name:);
