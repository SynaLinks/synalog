# Like('axb', 'a\\_b'): False.
# Expect: rows Q = []
Q(x: 1) :- Like('axb', 'a\\_b');
