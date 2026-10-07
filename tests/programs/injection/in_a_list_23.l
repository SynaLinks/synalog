# The string as a list element.
# Expect: rows Q = [('0x27 OR 1',)]
Q(s:) :- s in ["0x27 OR 1", "other"], s != "other";
