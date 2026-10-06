# Like('50 percent', '50\\%'): False.
# Expect: rows Q = []
Q(x: 1) :- Like('50 percent', '50\\%');
