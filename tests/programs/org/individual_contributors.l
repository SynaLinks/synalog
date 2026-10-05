# People who manage no one.
# Expect: rows L = [('acct',), ('dev2',), ('intern',), ('sre1',), ('sre2',)]
Manages(boss: "ceo", report: "cto");
Manages(boss: "ceo", report: "cfo");
Manages(boss: "cto", report: "dev1");
Manages(boss: "cto", report: "dev2");
Manages(boss: "cto", report: "ops");
Manages(boss: "cfo", report: "acct");
Manages(boss: "ops", report: "sre1");
Manages(boss: "ops", report: "sre2");
Manages(boss: "dev1", report: "intern");
Person(name:) distinct :- Manages(boss: name) | Manages(report: name);
Boss(name:) distinct :- Manages(boss: name);
@OrderBy(L, "name");
L(name:) :- Person(name:), ~Boss(name:);
