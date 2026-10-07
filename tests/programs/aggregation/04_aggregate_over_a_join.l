# Summing over a join.
# Expect: rows T = [("ann", 30), ("bob", 5)]
P(id: 1, name: "ann");
P(id: 2, name: "bob");
O(pid: 1, amount: 10);
O(pid: 1, amount: 20);
O(pid: 2, amount: 5);
@OrderBy(T, "name");
T(name:, total? += amount) distinct :- P(id:, name:), O(pid: id, amount:);
