# Test: The string in a record, read back. (from tests/programs/injection/in_a_record_20.l)

R(r: {v: "{x}; DROP"});
Q(s: r.v) :- R(r:);
