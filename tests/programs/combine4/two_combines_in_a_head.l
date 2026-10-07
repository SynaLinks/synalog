# Two combines in one head.
# Expect: rows Q = [('ann', 42, 2), ('bob', 55, 2), ('cid', 54, 3), ('dee', None, None)]
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
@OrderBy(Q, "c");
Q(c:, t: (combine += amt :- O(c:, amt:)), n: (combine += 1 :- O(c:))) :- C(c:);
