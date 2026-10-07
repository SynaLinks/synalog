# A string that looks like SQL is a value: it comes back unchanged.
# Expect: rows Q = [('0x27 OR 1',)]
Q(s: "0x27 OR 1");
