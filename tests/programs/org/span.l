# How many people are under each manager.
# Expect: rows S = [('ceo', 9), ('cfo', 1), ('cto', 6), ('dev1', 1), ('ops', 2)]
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
@OrderBy(S, "boss", "n");
S(boss:, n? += 1) distinct :- Under(boss:, report:);
