# Substr of 'hello world' from 7, 100 long.
# Expect: rows Q = [('world',)]
Q(s: Substr("hello world", 7, 100));
