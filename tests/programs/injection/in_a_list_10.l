# The string as a list element.
# Expect: rows Q = [("'; COMMIT; DROP TABLE t; --",)]
Q(s:) :- s in ["'; COMMIT; DROP TABLE t; --", "other"], s != "other";
