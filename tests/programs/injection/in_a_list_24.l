# The string as a list element.
# Expect: rows Q = [("'+(SELECT 1)+'",)]
Q(s:) :- s in ["'+(SELECT 1)+'", "other"], s != "other";
