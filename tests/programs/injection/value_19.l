# A string that looks like SQL is a value: it comes back unchanged.
# Expect: rows Q = [('%_\\%',)]
Q(s: "%_\%");
