# Null equals nothing, not even null: the condition holds on no row.
# Expect: rows Q = []
Q(ok: true) :- null == null;
