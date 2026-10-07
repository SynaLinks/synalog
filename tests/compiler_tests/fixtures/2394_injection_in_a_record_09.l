# Test: The string in a record, read back. (from tests/programs/injection/in_a_record_09.l)

R(r: {v: "-- comment"});
Q(s: r.v) :- R(r:);
