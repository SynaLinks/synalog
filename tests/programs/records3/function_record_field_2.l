# A field of a function's record, directly.
# Expect: rows Q = [(4,)]
Powers(x) = {x:, sq: x * x};
Q(v: Powers(2).sq);
