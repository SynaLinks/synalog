# Sharing a phone is symmetric.
# Expect: holds Shares.symmetric
HasPhone(account: "a1", phone: "555-1");
HasPhone(account: "a2", phone: "555-1");
HasPhone(account: "a2", phone: "555-2");
HasPhone(account: "a3", phone: "555-2");
HasPhone(account: "a4", phone: "555-3");
HasPhone(account: "a5", phone: "555-4");
HasPhone(account: "a6", phone: "555-4");
HasPhone(account: "a7", phone: "555-9");
Shares(a:, b:) distinct :- HasPhone(account: a, phone:), HasPhone(account: b, phone:), a != b;
@Assert(Shares, symmetric: "∀ a b, Shares a b → Shares b a");
