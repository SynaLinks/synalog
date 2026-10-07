# The sum of Range(-2); null when it is empty.
# Expect: rows Q = [(None,)]
Q(s? += x) distinct :- x in Range(-2);
