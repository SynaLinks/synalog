# Test: The smallest share of dee's total one order makes: a combine inside an aggregate. (from tests/programs/combine4/smallest_share_dee.l)

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
Q(s? Min= amt / (combine += a :- O(c: "dee", amt: a))) distinct :- O(c: "dee", amt:);
