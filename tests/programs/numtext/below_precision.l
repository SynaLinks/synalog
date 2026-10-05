# A number below the 15th decimal is 0.
# Expect: rows Q = [('0',)]
Q(s: ToString(1e-20));
