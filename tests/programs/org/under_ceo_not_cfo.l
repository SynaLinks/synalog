# People under ceo but not under cfo.
# Expect: rows D = [('cfo',), ('cto',), ('dev1',), ('dev2',), ('intern',), ('ops',), ('sre1',), ('sre2',)]
Manages(boss: "ceo", report: "cto");
Manages(boss: "ceo", report: "cfo");
Manages(boss: "cto", report: "dev1");
Manages(boss: "cto", report: "dev2");
Manages(boss: "cto", report: "ops");
Manages(boss: "cfo", report: "acct");
Manages(boss: "ops", report: "sre1");
Manages(boss: "ops", report: "sre2");
Manages(boss: "dev1", report: "intern");
@Recursive(Under, 8);
Under(boss:, report:) distinct :- Manages(boss:, report:);
Under(boss:, report: r) distinct :- Under(boss:, report:), Manages(boss: report, report: r);
@OrderBy(D, "report");
D(report:) :- Under(boss: "ceo", report:), ~Under(boss: "cfo", report:);
