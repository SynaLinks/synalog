# Test: A function of two strings. (from tests/programs/udf/02_two_arguments.l)

FullName(first, last) = first ++ " " ++ last;
S(v: FullName("Ada", "Lovelace"));
