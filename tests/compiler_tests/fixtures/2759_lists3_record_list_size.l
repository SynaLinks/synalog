# Test: The size of a list in a record. (from tests/programs/lists3/record_list_size.l)

R(id: 1, r: {name: "a", tags: ["x", "y"]});
R(id: 2, r: {name: "b", tags: []});
R(id: 3, r: {name: "c", tags: ["y"]});
@OrderBy(Q, "id", "n");
Q(id:, n: Size(r.tags)) :- R(id:, r:);
