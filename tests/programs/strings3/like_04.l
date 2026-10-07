# Like('axb', 'a_b'): True.
# Expect: rows Q = [(1,)]
Q(x: 1) :- Like('axb', 'a_b');
