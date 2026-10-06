# A variable only matched by Like.
# Expect: error Unbound variable 't'
V(x: 1, b: true, s: "ab");
V(x: 2, b: false, s: "ba");
V(x: 3, b: null, s: null);
Q(x:) :- V(x:), Like(t, "a%");
