# The size of a list in a record.
# Expect: rows Q = [(1, 2), (2, 0), (3, 1)]
R(id: 1, r: {name: "a", tags: ["x", "y"]});
R(id: 2, r: {name: "b", tags: []});
R(id: 3, r: {name: "c", tags: ["y"]});
@OrderBy(Q, "id", "n");
Q(id:, n: Size(r.tags)) :- R(id:, r:);
