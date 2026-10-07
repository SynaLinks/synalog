# -9 / 4 is exact.
# Expect: rows G = [(-2.25,)]
V(a: -9, b: 4);
G(r: a / b) :- V(a:, b:);
