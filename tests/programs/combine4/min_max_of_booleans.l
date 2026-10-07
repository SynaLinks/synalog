# The least and greatest of booleans: false before true.
# Expect: rows Q = [(1, False, True), (2, True, True)]
V(k: 1, b: true);
V(k: 1, b: false);
V(k: 2, b: true);
@OrderBy(Q, "k");
Q(k:, lo? Min= b, hi? Max= b) distinct :- V(k:, b:);
