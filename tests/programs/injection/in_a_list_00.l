# The string as a list element.
# Expect: rows Q = [("'; DROP TABLE t; --",)]
Q(s:) :- s in ["'; DROP TABLE t; --", "other"], s != "other";
