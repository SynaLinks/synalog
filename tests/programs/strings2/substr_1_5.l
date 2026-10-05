# Substr of 'hello world' from 1, 5 long.
# Expect: rows Q = [('hello',)]
Q(s: Substr("hello world", 1, 5));
