# The first match of 9+, null when none.
# Expect: rows Q = [(1, None), (2, None), (3, None), (4, None), (5, '999'), (6, None)]
C(id: 1, code: "AB-001", zone: "north", x: 12.5);
C(id: 2, code: "AB-017", zone: "south", x: -3.75);
C(id: 3, code: "XY-200", zone: "north", x: 0.0);
C(id: 4, code: "XY-031", zone: "east", x: 7.0);
C(id: 5, code: "QZ-999", zone: "south", x: -12.25);
C(id: 6, code: "AB-120", zone: "east", x: 99.9);
@OrderBy(Q, "id", "m");
Q(id:, m: RegexpExtract(code, "9+")) :- C(id:, code:);
