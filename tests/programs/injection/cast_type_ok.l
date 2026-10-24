# A plain parameterized type compiles and runs.
# Expect: rows Q = [(2,)]
Q(x:) :- x == Cast(2, "INT64");
