# Phones per account.
# Expect: rows P = [('a1', 1), ('a2', 2), ('a3', 1), ('a4', 1), ('a5', 1), ('a6', 1), ('a7', 1)]
HasPhone(account: "a1", phone: "555-1");
HasPhone(account: "a2", phone: "555-1");
HasPhone(account: "a2", phone: "555-2");
HasPhone(account: "a3", phone: "555-2");
HasPhone(account: "a4", phone: "555-3");
HasPhone(account: "a5", phone: "555-4");
HasPhone(account: "a6", phone: "555-4");
HasPhone(account: "a7", phone: "555-9");
@OrderBy(P, "account");
P(account:, n? += 1) distinct :- HasPhone(account:);
