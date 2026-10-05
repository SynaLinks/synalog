# A per-group sum, in ASCII.
# Expect: holds DeptPay.sum_per_dept_ascii
Emp(name: "ann", dept: "eng", salary: 100);
Emp(name: "bob", dept: "eng", salary: 80);
Emp(name: "cid", dept: "ops", salary: 60);
Emp(name: "dan", dept: "ops", salary: 60);
Emp(name: "eve", dept: "hr", salary: 50);
Boss(e: "bob", b: "ann");
Boss(e: "cid", b: "ann");
Boss(e: "dan", b: "cid");
Boss(e: "eve", b: "ann");
Floor(dept: "eng", floor: 3);
Floor(dept: "ops", floor: 1);
Floor(dept: "hr", floor: 2);
Floor(dept: "legal", floor: 4);
Skill(name: "ann", skill: "rust");
Skill(name: "ann", skill: "sql");
Skill(name: "bob", skill: "sql");
Skill(name: "cid", skill: "excel");
Skill(name: "eve", skill: "sql");
Pay(name:, salary:) :- Emp(name:, salary:);
DeptOf(name:, dept:) :- Emp(name:, dept:);
@Recursive(Reports, 4);
Reports(e:, b:) distinct :- Boss(e:, b:);
Reports(e:, b: c) distinct :- Reports(e:, b:), Boss(e: b, b: c);
DeptPay(dept:, total? += salary) distinct :- Emp(dept:, salary:);
PayIn(dept:, name:, salary:) :- Emp(name:, dept:, salary:);
@Assert(DeptPay, sum_per_dept_ascii: "forall d, DeptPay d = sum e, PayIn d e");
