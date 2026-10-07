# A field of a function's record, directly.
# Expect: rows Q = [(25,)]
Powers(x) = {x:, sq: x * x};
Q(v: Powers(5).sq);
