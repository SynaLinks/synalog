# a2 has two phones.
# Expect: violated HasPhone.one_phone 2
HasPhone(account: "a1", phone: "555-1");
HasPhone(account: "a2", phone: "555-1");
HasPhone(account: "a2", phone: "555-2");
HasPhone(account: "a3", phone: "555-2");
HasPhone(account: "a4", phone: "555-3");
HasPhone(account: "a5", phone: "555-4");
HasPhone(account: "a6", phone: "555-4");
HasPhone(account: "a7", phone: "555-9");
@Assert(HasPhone, one_phone: "∀ a p q, HasPhone a p → HasPhone a q → p = q");
