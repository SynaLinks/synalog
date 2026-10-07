# Debits and credits of rent.
# Expect: rows D = [(500, 0)]
Entry(txn: 1, account: "cash", amount: -500);
Entry(txn: 1, account: "rent", amount: 500);
Entry(txn: 2, account: "cash", amount: 1200);
Entry(txn: 2, account: "sales", amount: -1200);
Entry(txn: 3, account: "cash", amount: -80);
Entry(txn: 3, account: "food", amount: 50);
Entry(txn: 3, account: "travel", amount: 30);
Entry(txn: 4, account: "bank", amount: 1000);
Entry(txn: 4, account: "cash", amount: -1000);
Entry(txn: 5, account: "food", amount: 20);
Entry(txn: 5, account: "cash", amount: -15);
D(debit? += if amount > 0 then amount else 0, credit? += if amount < 0 then -amount else 0) distinct :-
  Entry(account: "rent", amount:);
