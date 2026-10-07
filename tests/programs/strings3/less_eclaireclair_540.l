# 'Eclair' < 'éclair', in code point order.
# Expect: rows Q = [(1,)]
Q(x: 1) :- "Eclair" < "éclair";
