# Test: 3 + 4 computed from columns. (from tests/programs/grid/add_01.l)

V(a: 3, b: 4);
G(a:, b:, r: a + b) :- V(a:, b:);
