# The sum of Range(1); null when it is empty.
# Expect: rows Q = [(0,)]
Q(s? += x) distinct :- x in Range(1);
