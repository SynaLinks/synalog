# How many direct reports each manager has.
# Expect: rows D = [('ceo', 2), ('cfo', 1), ('cto', 3), ('dev1', 1), ('ops', 2)]
Manages(boss: "ceo", report: "cto");
Manages(boss: "ceo", report: "cfo");
Manages(boss: "cto", report: "dev1");
Manages(boss: "cto", report: "dev2");
Manages(boss: "cto", report: "ops");
Manages(boss: "cfo", report: "acct");
Manages(boss: "ops", report: "sre1");
Manages(boss: "ops", report: "sre2");
Manages(boss: "dev1", report: "intern");
@OrderBy(D, "boss", "n");
D(boss:, n? += 1) distinct :- Manages(boss:);
