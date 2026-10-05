# Substr of 'hello world' from 1, 0 long.
# Expect: rows Q = [('',)]
Q(s: Substr("hello world", 1, 0));
