# Records from two rules.
# Expect: rows R = [(1,), (2,)]
V(r: {a: 1});
V(r: {a: 2});
@OrderBy(R, "a");
R(a: r.a) :- V(r:);
