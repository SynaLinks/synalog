# Test: A list of records of records, unnested. (from tests/programs/records3/list_of_nested_records.l)

R(l: [{a: {n: "p", v: 1}}, {a: {n: "q", v: 2}}]);
@OrderBy(Q, "n");
Q(n: e.a.n, v: e.a.v) :- R(l:), e in l;
