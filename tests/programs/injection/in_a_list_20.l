# The string as a list element.
# Expect: rows Q = [('{x}; DROP',)]
Q(s:) :- s in ["{x}; DROP", "other"], s != "other";
