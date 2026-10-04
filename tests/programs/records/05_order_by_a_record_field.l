# Ordering by a value taken from a record.
# Expect: rows O = [(1,), (2,)]
R(r: {k: 2});
R(r: {k: 1});
@OrderBy(O, "k");
O(k:) :- R(r:), k == r.k;
