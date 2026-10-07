# A boolean function filters when its value is compared.
# Expect: rows E = [(2,), (4,)]
IsEven(x) = (x % 2 == 0);
V(x:) :- x in [1, 2, 3, 4];
@OrderBy(E, "x");
E(x:) :- V(x:), IsEven(x) == true;
