# Test: The string in a record, read back. (from tests/programs/injection/in_a_record_02.l)

R(r: {v: "x' OR '1'='1"});
Q(s: r.v) :- R(r:);
