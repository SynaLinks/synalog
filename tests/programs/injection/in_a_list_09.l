# The string as a list element.
# Expect: rows Q = [('-- comment',)]
Q(s:) :- s in ["-- comment", "other"], s != "other";
