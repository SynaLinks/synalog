# The string as a list element.
# Expect: rows Q = [('a\\',)]
Q(s:) :- s in ["a\", "other"], s != "other";
