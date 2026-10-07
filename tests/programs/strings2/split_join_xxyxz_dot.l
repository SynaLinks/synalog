# Splitting then joining 'x.y.z' gives it back.
# Expect: rows Q = [('x.y.z',)]
Q(s: Join(Split("x.y.z", "."), "."));
