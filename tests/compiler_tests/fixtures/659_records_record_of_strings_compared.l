# Test: Filtering on a string field. (from tests/programs/records/16_record_of_strings_compared.l)

V(r: {k: "a", v: "x"});
V(r: {k: "b", v: "y"});
R(v: r.v) :- V(r:), r.k == "b";
