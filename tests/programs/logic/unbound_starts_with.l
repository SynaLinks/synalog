# A variable only tested by StartsWith.
# Expect: error Unbound variable 't'
V(x: 1, b: true, s: "ab");
V(x: 2, b: false, s: "ba");
V(x: 3, b: null, s: null);
Q(x:) :- V(x:), StartsWith(t, "a");
