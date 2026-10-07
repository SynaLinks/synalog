# Substr of 'hello world' from 1, 11 long.
# Expect: rows Q = [('hello world',)]
Q(s: Substr("hello world", 1, 11));
