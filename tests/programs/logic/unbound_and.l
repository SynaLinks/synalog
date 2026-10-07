# A variable only in a conjunction of conditions.
# Expect: error Unbound variable 'flag'
V(x: 1, b: true, s: "ab");
V(x: 2, b: false, s: "ba");
V(x: 3, b: null, s: null);
Q(x:) :- V(x:), flag && x > 0;
