# A quoted field name cannot end its own quoting.
# Expect: rows Q = [(1,)]
R(`a" AS x, 7 AS "b`: 1);
Q(x:) :- R(`a" AS x, 7 AS "b`: x);
