# Test: The string in a record, read back. (from tests/programs/injection/in_a_record_12.l)

R(r: {v: "E'\''"});
Q(s: r.v) :- R(r:);
