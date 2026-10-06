# Nested If.
# Expect: rows Q = [(1, 'pos'), (2, 'neg'), (3, 'neg'), (4, 'pos'), (5, 'neg'), (6, 'big')]
C(id: 1, code: "AB-001", zone: "north", x: 12.5);
C(id: 2, code: "AB-017", zone: "south", x: -3.75);
C(id: 3, code: "XY-200", zone: "north", x: 0.0);
C(id: 4, code: "XY-031", zone: "east", x: 7.0);
C(id: 5, code: "QZ-999", zone: "south", x: -12.25);
C(id: 6, code: "AB-120", zone: "east", x: 99.9);
@OrderBy(Q, "id", "s");
Q(id:, s: If(x > 50, "big", If(x > 0, "pos", "neg"))) :- C(id:, x:);
