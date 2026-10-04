# A function calling a function.
# Expect: rows R = [(16,)]
Square(x) = x * x;
Fourth(x) = Square(Square(x));
R(r: Fourth(2));
