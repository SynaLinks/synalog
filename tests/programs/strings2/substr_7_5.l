# Substr of 'hello world' from 7, 5 long.
# Expect: rows Q = [('world',)]
Q(s: Substr("hello world", 7, 5));
