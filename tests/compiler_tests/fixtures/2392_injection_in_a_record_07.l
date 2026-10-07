# Test: The string in a record, read back. (from tests/programs/injection/in_a_record_07.l)

R(r: {v: "a\"});
Q(s: r.v) :- R(r:);
