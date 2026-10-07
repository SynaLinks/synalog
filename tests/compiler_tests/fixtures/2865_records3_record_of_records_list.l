# Test: A list of records of records. (from tests/programs/records3/record_of_records_list.l)

R(l: [{p: {n: "x", v: 1}}, {p: {n: "y", v: 2}}]);
@OrderBy(Q, "n");
Q(n: e.p.n, v: e.p.v) :- R(l:), e in l;
