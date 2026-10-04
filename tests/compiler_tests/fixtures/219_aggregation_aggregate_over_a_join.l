# Test: Summing over a join. (from tests/programs/aggregation/04_aggregate_over_a_join.l)

P(id: 1, name: "ann");
P(id: 2, name: "bob");
O(pid: 1, amount: 10);
O(pid: 1, amount: 20);
O(pid: 2, amount: 5);
@OrderBy(T, "name");
T(name:, total? += amount) distinct :- P(id:, name:), O(pid: id, amount:);
