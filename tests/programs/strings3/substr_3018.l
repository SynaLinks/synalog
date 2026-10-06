# The first two characters of '日本語'.
# Expect: rows Q = [('日本',)]
Q(s: Substr("日本語", 1, 2));
