# The string as a list element.
# Expect: rows Q = [('/* comment */ x',)]
Q(s:) :- s in ["/* comment */ x", "other"], s != "other";
