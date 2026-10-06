# A list of records in a record.
# Expect: rows Q = [("a", "p"), ("a", "q"), ("b", "r")]
T(r: {name: "a", items: [{n: "p"}, {n: "q"}]});
T(r: {name: "b", items: [{n: "r"}]});
@OrderBy(Q, "name", "item");
Q(name: r.name, item: i.n) :- T(r:), i in r.items;
