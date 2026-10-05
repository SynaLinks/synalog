# Test: A string matched as a Like pattern of itself, wildcards escaped. (from tests/programs/injection/like_itself_04.l)

V(id: 1, s: "\'; DROP TABLE t; --");
V(id: 2, s: "plain");
Q(id:) :- V(id:, s:), Like(s, "\\'; DROP TABLE t; --");
