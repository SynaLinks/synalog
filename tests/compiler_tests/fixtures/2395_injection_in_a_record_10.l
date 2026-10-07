# Test: The string in a record, read back. (from tests/programs/injection/in_a_record_10.l)

R(r: {v: "'; COMMIT; DROP TABLE t; --"});
Q(s: r.v) :- R(r:);
