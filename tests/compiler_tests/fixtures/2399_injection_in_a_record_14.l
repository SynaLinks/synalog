# Test: The string in a record, read back. (from tests/programs/injection/in_a_record_14.l)

R(r: {v: '\\"'});
Q(s: r.v) :- R(r:);
