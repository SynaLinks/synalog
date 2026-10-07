# A variable only negated has no value.
# Expect: error Unbound variable 'flag'
V(x: 1, b: true, s: "ab");
V(x: 2, b: false, s: "ba");
V(x: 3, b: null, s: null);
Q(x:) :- V(x:), !flag;
