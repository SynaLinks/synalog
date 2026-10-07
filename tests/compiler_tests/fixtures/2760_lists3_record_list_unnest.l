# Test: Unnesting a list in a record. (from tests/programs/lists3/record_list_unnest.l)

R(id: 1, r: {name: "a", tags: ["x", "y"]});
R(id: 2, r: {name: "b", tags: []});
R(id: 3, r: {name: "c", tags: ["y"]});
@OrderBy(Q, "id", "t");
Q(id:, t:) :- R(id:, r:), t in r.tags;
