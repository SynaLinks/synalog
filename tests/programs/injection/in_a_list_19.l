# The string as a list element.
# Expect: rows Q = [('%_\\%',)]
Q(s:) :- s in ["%_\%", "other"], s != "other";
