# Like('ABC', 'a%'): False.
# Expect: rows Q = []
Q(x: 1) :- Like('ABC', 'a%');
