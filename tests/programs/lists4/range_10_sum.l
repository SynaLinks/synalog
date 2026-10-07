# The sum of Range(10); null when it is empty.
# Expect: rows Q = [(45,)]
Q(s? += x) distinct :- x in Range(10);
