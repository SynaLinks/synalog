# Test: A string matched as a Like pattern of itself, wildcards escaped. (from tests/programs/injection/like_itself_02.l)

V(id: 1, s: "x' OR '1'='1");
V(id: 2, s: "plain");
Q(id:) :- V(id:, s:), Like(s, "x' OR '1'='1");
