# Coalesce replaces null.
# Expect: rows C = [(7,)]
C(x: Coalesce(null, 7));
