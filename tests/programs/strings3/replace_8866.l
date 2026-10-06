# Every '%' in '50%' replaced by ' percent', as text.
# Expect: rows Q = [('50 percent',)]
Q(s: Replace('50%', '%', " percent"));
