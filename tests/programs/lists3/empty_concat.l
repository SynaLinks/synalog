# Concatenating empty lists.
# Expect: rows Q = [(0, 2)]
Q(a: Size(ArrayConcat([], [])), b: Size(ArrayConcat([], [1, 2])));
