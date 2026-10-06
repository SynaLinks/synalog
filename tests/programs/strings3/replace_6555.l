# Every '$' in 'a$b' replaced by 'S', as text.
# Expect: rows Q = [('aSb',)]
Q(s: Replace('a$b', '$', "S"));
