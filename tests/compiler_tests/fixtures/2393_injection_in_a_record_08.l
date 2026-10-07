# Test: The string in a record, read back. (from tests/programs/injection/in_a_record_08.l)

R(r: {v: "/* comment */ x"});
Q(s: r.v) :- R(r:);
