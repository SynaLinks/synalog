# Like('a%b', 'a\\%%'): True.
# Expect: rows Q = [(1,)]
Q(x: 1) :- Like('a%b', 'a\\%%');
