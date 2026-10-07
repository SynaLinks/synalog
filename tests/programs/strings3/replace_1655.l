# Every '.' in 'a.b.c' replaced by '-', as text.
# Expect: rows Q = [('a-b-c',)]
Q(s: Replace('a.b.c', '.', "-"));
