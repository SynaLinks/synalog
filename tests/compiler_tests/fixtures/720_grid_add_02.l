# Test: -2 + 5 computed from columns. (from tests/programs/grid/add_02.l)

V(a: -2, b: 5);
G(a:, b:, r: a + b) :- V(a:, b:);
