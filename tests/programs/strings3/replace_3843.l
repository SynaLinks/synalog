# Every '\\' in 'a\\b' replaced by '/', as text.
# Expect: rows Q = [('a/b',)]
Q(s: Replace('a\\b', '\\', "/"));
