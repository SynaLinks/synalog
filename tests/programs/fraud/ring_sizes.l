# The size of each ring, named by its smallest account.
# Expect: rows Z = [('a1', 3), ('a4', 1), ('a5', 2), ('a7', 1)]
HasPhone(account: "a1", phone: "555-1");
HasPhone(account: "a2", phone: "555-1");
HasPhone(account: "a2", phone: "555-2");
HasPhone(account: "a3", phone: "555-2");
HasPhone(account: "a4", phone: "555-3");
HasPhone(account: "a5", phone: "555-4");
HasPhone(account: "a6", phone: "555-4");
HasPhone(account: "a7", phone: "555-9");
Shares(a:, b:) distinct :- HasPhone(account: a, phone:), HasPhone(account: b, phone:), a != b;
@Recursive(Linked, 8);
Linked(a:, b:) distinct :- Shares(a:, b:);
Linked(a:, b: c) distinct :- Linked(a:, b:), Shares(a: b, b: c);
Account(account:) distinct :- HasPhone(account:);
Member(account:, other:) distinct :- Account(account:), other == account | Linked(a: account, b: other);
Root(account:, root? Min= other) distinct :- Member(account:, other:);
@OrderBy(Z, "root");
Z(root:, n? += 1) distinct :- Root(account:, root:);
