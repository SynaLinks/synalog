# Each person's manager's manager.
# Expect: rows S = [('ceo', 'acct'), ('ceo', 'dev1'), ('ceo', 'dev2'), ('ceo', 'ops'), ('cto', 'intern'), ('cto', 'sre1'), ('cto', 'sre2')]
Manages(boss: "ceo", report: "cto");
Manages(boss: "ceo", report: "cfo");
Manages(boss: "cto", report: "dev1");
Manages(boss: "cto", report: "dev2");
Manages(boss: "cto", report: "ops");
Manages(boss: "cfo", report: "acct");
Manages(boss: "ops", report: "sre1");
Manages(boss: "ops", report: "sre2");
Manages(boss: "dev1", report: "intern");
@OrderBy(S, "boss", "report");
S(boss:, report:) :- Manages(boss:, report: m), Manages(boss: m, report:);
