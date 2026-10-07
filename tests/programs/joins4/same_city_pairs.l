# Pairs of employees working in one city: a three-way join.
# Expect: rows Q = [('ann', 'bob'), ('ann', 'dee'), ('ann', 'gus'), ('ann', 'hal'), ('bob', 'dee'), ('bob', 'gus'), ('bob', 'hal'), ('cid', 'eve'), ('dee', 'gus'), ('dee', 'hal'), ('gus', 'hal')]
E(id: 1, n: "ann", boss: null, d: 10, pay: 5000);
E(id: 2, n: "bob", boss: 1, d: 10, pay: 4000);
E(id: 3, n: "cid", boss: 1, d: 20, pay: 4200);
E(id: 4, n: "dee", boss: 2, d: 10, pay: 3000);
E(id: 5, n: "eve", boss: 3, d: 20, pay: 3100);
E(id: 6, n: "fay", boss: 3, d: null, pay: 2900);
E(id: 7, n: "gus", boss: null, d: 30, pay: 6000);
E(id: 8, n: "hal", boss: 7, d: 30, pay: 2500);
D(d: 10, dn: "sales", city: "paris");
D(d: 20, dn: "tech", city: "oslo");
D(d: 30, dn: "ops", city: "paris");
D(d: 40, dn: "legal", city: "rome");
@OrderBy(Q, "a", "b");
Q(a:, b:) :- E(n: a, d: da), E(n: b, d: db), D(d: da, city:), D(d: db, city:), a < b;
