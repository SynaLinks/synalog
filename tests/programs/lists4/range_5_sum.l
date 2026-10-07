# The sum of Range(5); null when it is empty.
# Expect: rows Q = [(10,)]
Q(s? += x) distinct :- x in Range(5);
