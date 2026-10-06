# Every match of [0-9]+ replaced by #.
# Expect: rows Q = [(1, 'AB-#'), (2, 'AB-#'), (3, 'XY-#'), (4, 'XY-#'), (5, 'QZ-#'), (6, 'AB-#')]
C(id: 1, code: "AB-001", zone: "north", x: 12.5);
C(id: 2, code: "AB-017", zone: "south", x: -3.75);
C(id: 3, code: "XY-200", zone: "north", x: 0.0);
C(id: 4, code: "XY-031", zone: "east", x: 7.0);
C(id: 5, code: "QZ-999", zone: "south", x: -12.25);
C(id: 6, code: "AB-120", zone: "east", x: 99.9);
@OrderBy(Q, "id", "s");
Q(id:, s: RegexpReplace(code, "[0-9]+", "#")) :- C(id:, code:);
