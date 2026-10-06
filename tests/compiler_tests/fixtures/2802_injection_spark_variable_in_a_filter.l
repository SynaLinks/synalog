# Test: A string with ${...} matched by a filter. (from tests/programs/injection/spark_variable_in_a_filter.l)

V(id: 1, s: "${a}");
V(id: 2, s: "");
Q(id:) :- V(id:, s:), s == "${a}";
