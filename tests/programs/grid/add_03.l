# 7 + -3 computed from columns.
# Expect: rows G = [(7, -3, 4)]
V(a: 7, b: -3);
G(a:, b:, r: a + b) :- V(a:, b:);
