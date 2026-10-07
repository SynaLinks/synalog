# A Like pattern holding ${...}.
# Expect: rows Q = [(1,)]
V(id: 1, s: "${a}b");
V(id: 2, s: "b");
Q(id:) :- V(id:, s:), Like(s, "${a}%");
