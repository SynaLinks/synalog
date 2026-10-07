# Binary noise past 15 significant digits is not written.
# Expect: rows Q = [('0.3',)]
Q(s: ToString(0.1 + 0.2));
