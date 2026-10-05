# Test: The string in a record, read back. (from tests/programs/injection/in_a_record_15.l)

R(r: {v: "');ATTACH DATABASE 'x' AS y;--"});
Q(s: r.v) :- R(r:);
