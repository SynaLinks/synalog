# A string that looks like SQL is a value: it comes back unchanged.
# Expect: rows Q = [("x' OR '1'='1",)]
Q(s: "x' OR '1'='1");
