# Test: A function calling a function. (from tests/programs/functions/03_function_of_a_function.l)

Square(x) = x * x;
Fourth(x) = Square(Square(x));
R(r: Fourth(2));
