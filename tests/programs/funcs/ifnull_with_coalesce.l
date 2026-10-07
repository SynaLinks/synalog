# Ifnull agrees with Coalesce.
# Expect: rows Q = [(1,)]
Q(ok: 1) :- Ifnull(null, 5) == Coalesce(null, 5);
