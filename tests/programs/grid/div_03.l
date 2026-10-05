# 1 / 8 is exact.
# Expect: rows G = [(0.125,)]
V(a: 1, b: 8);
G(r: a / b) :- V(a:, b:);
