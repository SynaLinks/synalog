# Test: A boolean field as a condition. (from tests/programs/logic/bare_boolean_field.l)

V(x: 1, r: {ok: false});
V(x: 2, r: {ok: true});
Q(x:) :- V(x:, r:), r.ok;
