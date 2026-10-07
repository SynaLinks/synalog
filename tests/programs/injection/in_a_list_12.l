# The string as a list element.
# Expect: rows Q = [("E'\\''",)]
Q(s:) :- s in ["E'\''", "other"], s != "other";
