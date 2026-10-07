# Three levels of records.
# Expect: rows Q = [(7,)]
R(r: {a: {b: {c: 7}}});
Q(v: r.a.b.c) :- R(r:);
