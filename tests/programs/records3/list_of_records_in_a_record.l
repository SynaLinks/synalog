# A list of records inside a record, unnested.
# Expect: rows Q = [("a", 1), ("a", 2), ("b", 5)]
R(r: {name: "a", xs: [{v: 1}, {v: 2}]});
R(r: {name: "b", xs: [{v: 5}]});
@OrderBy(Q, "name", "v");
Q(name: r.name, v: x.v) :- R(r:), x in r.xs;
