# Test: The string in a record, read back. (from tests/programs/injection/in_a_record_21.l)

R(r: {v: 'a\tb'});
Q(s: r.v) :- R(r:);
