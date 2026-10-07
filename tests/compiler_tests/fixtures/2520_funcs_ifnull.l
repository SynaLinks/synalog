# Test: A missing zone defaults. (from tests/programs/funcs/ifnull.l)

V(id: 1, z: "n");
V(id: 2, z: null);
@OrderBy(Q, "id");
Q(id:, z: Ifnull(z, "?")) :- V(id:, z:);
