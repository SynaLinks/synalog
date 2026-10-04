# Test: Joining on a field of a record. (from tests/programs/records/04_record_field_in_a_join.l)

R(r: {id: 1});
S(id: 1, v: "x");
J(v:) :- R(r:), S(id: r.id, v:);
