# Test: Large products of numbers with a point do not overflow. (from tests/programs/math2/large_decimal_product.l)

V(x: 2.5);
V(x: 1000000);
Q(v? Max= x * x * 2.5) distinct :- V(x:);
