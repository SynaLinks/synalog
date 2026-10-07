# A missing zone defaults.
# Expect: rows Q = [(1, 'n'), (2, '?')]
V(id: 1, z: "n");
V(id: 2, z: null);
@OrderBy(Q, "id");
Q(id:, z: Ifnull(z, "?")) :- V(id:, z:);
