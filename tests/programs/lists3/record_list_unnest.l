# Unnesting a list in a record.
# Expect: rows Q = [(1, "x"), (1, "y"), (3, "y")]
R(id: 1, r: {name: "a", tags: ["x", "y"]});
R(id: 2, r: {name: "b", tags: []});
R(id: 3, r: {name: "c", tags: ["y"]});
@OrderBy(Q, "id", "t");
Q(id:, t:) :- R(id:, r:), t in r.tags;
