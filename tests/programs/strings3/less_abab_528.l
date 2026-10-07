# 'a b' < 'a-b', in code point order.
# Expect: rows Q = [(1,)]
Q(x: 1) :- "a b" < "a-b";
