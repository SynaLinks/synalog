# A string that looks like SQL is a value: it comes back unchanged.
# Expect: rows Q = [("') UNION SELECT 1 --",)]
Q(s: "') UNION SELECT 1 --");
