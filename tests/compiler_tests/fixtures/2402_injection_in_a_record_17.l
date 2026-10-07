# Test: The string in a record, read back. (from tests/programs/injection/in_a_record_17.l)

R(r: {v: "''''"});
Q(s: r.v) :- R(r:);
