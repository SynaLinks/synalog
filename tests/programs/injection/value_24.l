# A string that looks like SQL is a value: it comes back unchanged.
# Expect: rows Q = [("'+(SELECT 1)+'",)]
Q(s: "'+(SELECT 1)+'");
