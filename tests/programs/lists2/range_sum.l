# The sum of the numbers below 10.
# Expect: rows Q = [(45,)]
Q(s? += x) distinct :- x in Range(10);
