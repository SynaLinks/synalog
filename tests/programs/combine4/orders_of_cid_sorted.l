# cid's order amounts, sorted by id, joined.
# Expect: rows Q = [('7;7;40',)]
C(c: "ann");
C(c: "bob");
C(c: "cid");
C(c: "dee");
O(id: 1, c: "ann", amt: 30);
O(id: 2, c: "ann", amt: 12);
O(id: 3, c: "bob", amt: 50);
O(id: 4, c: "cid", amt: 7);
O(id: 5, c: "cid", amt: 7);
O(id: 6, c: "cid", amt: 40);
O(id: 7, c: "bob", amt: 5);
Q(s: Join((combine Array= id -> ToString(amt) :- O(c: "cid", id:, amt:)), ";"));
