# Every '*' in 'x*y' replaced by '+', as text.
# Expect: rows Q = [('x+y',)]
Q(s: Replace('x*y', '*', "+"));
