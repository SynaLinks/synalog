# Test: A list of records inside a record, unnested. (from tests/programs/records3/list_of_records_in_a_record.l)

R(r: {name: "a", xs: [{v: 1}, {v: 2}]});
R(r: {name: "b", xs: [{v: 5}]});
@OrderBy(Q, "name", "v");
Q(name: r.name, v: x.v) :- R(r:), x in r.xs;
