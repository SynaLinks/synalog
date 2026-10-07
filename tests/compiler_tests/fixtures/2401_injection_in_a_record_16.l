# Test: The string in a record, read back. (from tests/programs/injection/in_a_record_16.l)

R(r: {v: "' || (SELECT 1) || '"});
Q(s: r.v) :- R(r:);
