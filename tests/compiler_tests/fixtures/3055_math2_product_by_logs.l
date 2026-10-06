# Test: The product of the positive values, through logarithms. (from tests/programs/math2/product_by_logs.l)

V(id: 1, x: 7);
V(id: 2, x: -7);
V(id: 3, x: 2.5);
V(id: 4, x: -2.5);
V(id: 5, x: 0);
V(id: 6, x: 3);
V(id: 7, x: 0.125);
V(id: 8, x: 1000000);
V(id: 9, x: -0.75);
V(id: 10, x: 12.345);
S(s? += Log(x)) distinct :- V(x:), x > 0;
Q(v: Exp(s)) :- S(s:);
