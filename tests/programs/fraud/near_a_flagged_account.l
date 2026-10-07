# Accounts linked to a flagged one.
# Expect: rows N = [('a2',), ('a3',), ('a6',)]
HasPhone(account: "a1", phone: "555-1");
HasPhone(account: "a2", phone: "555-1");
HasPhone(account: "a2", phone: "555-2");
HasPhone(account: "a3", phone: "555-2");
HasPhone(account: "a4", phone: "555-3");
HasPhone(account: "a5", phone: "555-4");
HasPhone(account: "a6", phone: "555-4");
HasPhone(account: "a7", phone: "555-9");
Shares(a:, b:) distinct :- HasPhone(account: a, phone:), HasPhone(account: b, phone:), a != b;
Flagged(account: "a1");
Flagged(account: "a5");
@Recursive(Linked, 8);
Linked(a:, b:) distinct :- Shares(a:, b:);
Linked(a:, b: c) distinct :- Linked(a:, b:), Shares(a: b, b: c);
@OrderBy(N, "account");
N(account: b) distinct :- Flagged(account: a), Linked(a:, b:), ~Flagged(account: b);
