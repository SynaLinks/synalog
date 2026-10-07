# 'ab' sorts before 'b'.
# Expect: rows Q = [(1,)]
Q(ok: 1) :- "ab" < "b";
