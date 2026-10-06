# Ifnull of Ifnull.
# Expect: rows Q = [(3,)]
Q(v: Ifnull(null, Ifnull(null, 3)));
