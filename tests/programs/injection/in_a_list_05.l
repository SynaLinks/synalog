# The string as a list element.
# Expect: rows Q = [('\\',)]
Q(s:) :- s in ["\", "other"], s != "other";
