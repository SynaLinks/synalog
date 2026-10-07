# Test: The largest customer total, a combine over combines. (from tests/programs/combine4/combine_of_combines.l)

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
T(c:, t: (combine += amt :- O(c:, amt:))) :- C(c:);
Q(m: (combine Max= t :- T(t:)));
