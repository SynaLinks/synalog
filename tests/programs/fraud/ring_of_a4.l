# Accounts connected to a4 through shared phones, at any distance.
# Expect: rows R = []
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
@OrderBy(R, "b");
R(b:) distinct :- Linked(a: "a4", b:), b != "a4";
