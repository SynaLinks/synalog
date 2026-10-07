# Test: The accounts holding phone 555-3. (from tests/programs/fraud/holders_of_555_3.l)

HasPhone(account: "a1", phone: "555-1");
HasPhone(account: "a2", phone: "555-1");
HasPhone(account: "a2", phone: "555-2");
HasPhone(account: "a3", phone: "555-2");
HasPhone(account: "a4", phone: "555-3");
HasPhone(account: "a5", phone: "555-4");
HasPhone(account: "a6", phone: "555-4");
HasPhone(account: "a7", phone: "555-9");
@OrderBy(H, "account");
H(account:) :- HasPhone(account:, phone: "555-3");
