# is null / is not null.
# Expect: valid
# Expect: rows Known = [(1,)]
# Expect: rows Unknown = []

Row(x: 1, y: 2);
Known(x:) :- Row(x:, y:), y is not null;
Unknown(x:) :- Row(x:, y:), y is null;
