# Test: A function calling another. (from tests/programs/udf/03_function_of_a_function.l)

Double(x) = 2 * x;
Quad(x) = Double(Double(x));
S(v: Quad(3));
