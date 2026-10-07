# The string as a list element.
# Expect: rows Q = [("');ATTACH DATABASE 'x' AS y;--",)]
Q(s:) :- s in ["');ATTACH DATABASE 'x' AS y;--", "other"], s != "other";
