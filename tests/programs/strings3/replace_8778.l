# Every 'l' in 'hello' replaced by '', as text.
# Expect: rows Q = [('heo',)]
Q(s: Replace('hello', 'l', ""));
