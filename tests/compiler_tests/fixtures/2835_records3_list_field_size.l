# Test: The size of a list field. (from tests/programs/records3/list_field_size.l)

S(k: 1, r: {name: "a", xs: [1, 2, 3]});
S(k: 2, r: {name: "b", xs: [4]});
S(k: 3, r: {name: "c", xs: []});
@OrderBy(Q, "k");
Q(k:, n: Size(r.xs)) :- S(k:, r:);
