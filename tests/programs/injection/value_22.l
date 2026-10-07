# A string that looks like SQL is a value: it comes back unchanged.
# Expect: rows Q = [('’; DROP TABLE t; --',)]
Q(s: "’; DROP TABLE t; --");
