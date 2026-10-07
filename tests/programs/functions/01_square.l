# A user-defined function.
# Expect: rows R = [(9,)]
Square(x) = x * x;
R(r: Square(3));
