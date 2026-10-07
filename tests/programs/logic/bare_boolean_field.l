# A boolean field as a condition.
# Expect: rows Q = [(2,)]
V(x: 1, r: {ok: false});
V(x: 2, r: {ok: true});
Q(x:) :- V(x:, r:), r.ok;
