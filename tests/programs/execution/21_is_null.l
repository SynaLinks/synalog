# Filtering null values.
# Expect: rows Known = [(1,)]
R(x: 1);
R(x: null);
Known(x:) :- R(x:), ~IsNull(x);
