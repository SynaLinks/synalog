# Test: A Like pattern holding ${...}. (from tests/programs/injection/spark_variable_in_a_like.l)

V(id: 1, s: "${a}b");
V(id: 2, s: "b");
Q(id:) :- V(id:, s:), Like(s, "${a}%");
