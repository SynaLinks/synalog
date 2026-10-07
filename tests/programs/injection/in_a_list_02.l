# The string as a list element.
# Expect: rows Q = [("x' OR '1'='1",)]
Q(s:) :- s in ["x' OR '1'='1", "other"], s != "other";
