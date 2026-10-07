# 'a' sorts before 'ab'.
# Expect: rows Q = [(1,)]
Q(ok: 1) :- "a" < "ab";
