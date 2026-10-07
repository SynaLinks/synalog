# The sum of Range(3); null when it is empty.
# Expect: rows Q = [(3,)]
Q(s? += x) distinct :- x in Range(3);
