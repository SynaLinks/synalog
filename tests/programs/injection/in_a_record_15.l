# The string in a record, read back.
# Expect: rows Q = [("');ATTACH DATABASE 'x' AS y;--",)]
R(r: {v: "');ATTACH DATABASE 'x' AS y;--"});
Q(s: r.v) :- R(r:);
