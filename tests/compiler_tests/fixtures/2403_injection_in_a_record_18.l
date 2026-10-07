# Test: The string in a record, read back. (from tests/programs/injection/in_a_record_18.l)

R(r: {v: "\x27; DROP TABLE t"});
Q(s: r.v) :- R(r:);
