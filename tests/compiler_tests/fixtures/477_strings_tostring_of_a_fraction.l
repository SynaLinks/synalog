# Test: A fraction as text is written plainly, not in scientific notation. (from tests/programs/strings/29_tostring_of_a_fraction.l)

V(x: 1.5, y: 42, z: null);
V(x: 2.5, y: 7, z: 1);
S(a: ToString(x), b: ToString(y), c: ToString(z)) :- V(x:, y:, z:), x < 2;
