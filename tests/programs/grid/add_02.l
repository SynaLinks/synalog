# -2 + 5 computed from columns.
# Expect: rows G = [(-2, 5, 3)]
V(a: -2, b: 5);
G(a:, b:, r: a + b) :- V(a:, b:);
