# Ordering by a field read from a record.
# Expect: rows R = [(1,), (2,)]
V(r: {k: 2});
V(r: {k: 1});
@OrderBy(R, "k");
R(k: r.k) :- V(r:);
