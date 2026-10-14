# A field name keeps its case: it is quoted, so an engine that folds names finds it.
# Expect: rows Q = [(1,)]
R(createdAt: 1);
Q(x:) :- R(createdAt: x);
