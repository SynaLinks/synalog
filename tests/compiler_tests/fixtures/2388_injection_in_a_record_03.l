# Test: The string in a record, read back. (from tests/programs/injection/in_a_record_03.l)

R(r: {v: "') UNION SELECT 1 --"});
Q(s: r.v) :- R(r:);
