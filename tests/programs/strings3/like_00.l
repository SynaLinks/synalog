# Like('50%', '50\\%'): True.
# Expect: rows Q = [(1,)]
Q(x: 1) :- Like('50%', '50\\%');
