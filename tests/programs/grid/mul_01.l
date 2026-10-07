# 3 * 4 computed from columns.
# Expect: rows G = [(3, 4, 12)]
V(a: 3, b: 4);
G(a:, b:, r: a * b) :- V(a:, b:);
