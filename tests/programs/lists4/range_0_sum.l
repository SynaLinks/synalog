# The sum of Range(0); null when it is empty.
# Expect: rows Q = [(None,)]
Q(s? += x) distinct :- x in Range(0);
