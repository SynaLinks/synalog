# Test: Three levels of records. (from tests/programs/records3/three_levels.l)

R(r: {a: {b: {c: 7}}});
Q(v: r.a.b.c) :- R(r:);
