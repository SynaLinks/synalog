# Test: 7 + -3 computed from columns. (from tests/programs/grid/add_03.l)

V(a: 7, b: -3);
G(a:, b:, r: a + b) :- V(a:, b:);
