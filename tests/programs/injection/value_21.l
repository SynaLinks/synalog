# A string that looks like SQL is a value: it comes back unchanged.
# Expect: rows Q = [('a\tb',)]
Q(s: 'a\tb');
