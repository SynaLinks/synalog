# A string that looks like SQL is a value: it comes back unchanged.
# Expect: rows Q = [("');ATTACH DATABASE 'x' AS y;--",)]
Q(s: "');ATTACH DATABASE 'x' AS y;--");
