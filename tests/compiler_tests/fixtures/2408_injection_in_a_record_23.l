# Test: The string in a record, read back. (from tests/programs/injection/in_a_record_23.l)

R(r: {v: "0x27 OR 1"});
Q(s: r.v) :- R(r:);
