# Membership in a list in a record.
# Expect: rows Q = [(1,), (3,)]
R(id: 1, r: {name: "a", tags: ["x", "y"]});
R(id: 2, r: {name: "b", tags: []});
R(id: 3, r: {name: "c", tags: ["y"]});
@OrderBy(Q, "id");
Q(id:) :- R(id:, r:), "y" in r.tags;
