# Like('a_b', 'a\\_b'): True.
# Expect: rows Q = [(1,)]
Q(x: 1) :- Like('a_b', 'a\\_b');
