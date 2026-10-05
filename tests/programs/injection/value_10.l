# A string that looks like SQL is a value: it comes back unchanged.
# Expect: rows Q = [("'; COMMIT; DROP TABLE t; --",)]
Q(s: "'; COMMIT; DROP TABLE t; --");
