# 'z' < 'ä', in code point order.
# Expect: rows Q = [(1,)]
Q(x: 1) :- "z" < "ä";
