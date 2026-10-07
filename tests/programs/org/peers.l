# People with the same manager.
# Expect: rows Peer = [('cfo', 'cto'), ('cto', 'cfo'), ('dev1', 'dev2'), ('dev1', 'ops'), ('dev2', 'dev1'), ('dev2', 'ops'), ('ops', 'dev1'), ('ops', 'dev2'), ('sre1', 'sre2'), ('sre2', 'sre1')]
Manages(boss: "ceo", report: "cto");
Manages(boss: "ceo", report: "cfo");
Manages(boss: "cto", report: "dev1");
Manages(boss: "cto", report: "dev2");
Manages(boss: "cto", report: "ops");
Manages(boss: "cfo", report: "acct");
Manages(boss: "ops", report: "sre1");
Manages(boss: "ops", report: "sre2");
Manages(boss: "dev1", report: "intern");
@OrderBy(Peer, "a", "b");
Peer(a:, b:) :- Manages(boss:, report: a), Manages(boss:, report: b), a != b;
