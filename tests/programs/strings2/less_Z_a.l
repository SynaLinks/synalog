# 'Z' sorts before 'a'.
# Expect: rows Q = [(1,)]
Q(ok: 1) :- "Z" < "a";
