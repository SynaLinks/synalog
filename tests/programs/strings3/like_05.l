# Like('abc', 'a%'): True.
# Expect: rows Q = [(1,)]
Q(x: 1) :- Like('abc', 'a%');
