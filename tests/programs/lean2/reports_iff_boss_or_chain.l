# The closure is its own definition.
# Expect: holds Reports.reports_iff_boss_or_chain
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
Pay(name:, salary:) :- Emp(name:, salary:);
DeptOf(name:, dept:) :- Emp(name:, dept:);
DeptPay(dept:, total? += salary) distinct :- Emp(dept:, salary:);
@Recursive(Reports, 4);
Reports(e:, b:) distinct :- Boss(e:, b:);
Reports(e:, b: c) distinct :- Reports(e:, b:), Boss(e: b, b: c);
@Assert(Reports, reports_iff_boss_or_chain: "∀ e c, Reports e c ↔ Boss e c ∨ ∃ b, Boss e b ∧ Reports b c");
