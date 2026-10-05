# Test: A function over substrings. (from tests/programs/udf/11_initials.l)

Initials(a, b) = Substr(a, 1, 1) ++ Substr(b, 1, 1);
S(v: Initials("Ada", "Lovelace"));
