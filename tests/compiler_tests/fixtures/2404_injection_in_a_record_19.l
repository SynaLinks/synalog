# Test: The string in a record, read back. (from tests/programs/injection/in_a_record_19.l)

R(r: {v: "%_\%"});
Q(s: r.v) :- R(r:);
