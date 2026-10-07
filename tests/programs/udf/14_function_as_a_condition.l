# A function written as a condition holds whatever its value: refused.
# Expect: error 'IsEven' is a function: as a condition, IsEven(...) holds whatever its value; compare its value (IsEven(...) == true) in: E(x:) :- V(x:), IsEven(x)
IsEven(x) = (x % 2 == 0);
V(x:) :- x in [1, 2, 3, 4];
E(x:) :- V(x:), IsEven(x);
