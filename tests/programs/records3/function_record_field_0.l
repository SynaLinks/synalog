# A field of a function's record, directly.
# Expect: rows Q = [(0,)]
Powers(x) = {x:, sq: x * x};
Q(v: Powers(0).sq);
