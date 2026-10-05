# Test: A boolean function filters when its value is compared. (from tests/programs/udf/08_boolean_function_compared.l)

IsEven(x) = (x % 2 == 0);
V(x:) :- x in [1, 2, 3, 4];
@OrderBy(E, "x");
E(x:) :- V(x:), IsEven(x) == true;
