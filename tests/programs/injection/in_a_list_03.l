# The string as a list element.
# Expect: rows Q = [("') UNION SELECT 1 --",)]
Q(s:) :- s in ["') UNION SELECT 1 --", "other"], s != "other";
