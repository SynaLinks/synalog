# Like('é', '_'): True.
# Expect: rows Q = [(1,)]
Q(x: 1) :- Like('é', '_');
