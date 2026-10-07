# The string as a list element.
# Expect: rows Q = [('a\tb',)]
Q(s:) :- s in ['a\tb', "other"], s != "other";
