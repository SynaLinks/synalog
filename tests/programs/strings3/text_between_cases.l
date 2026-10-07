# Upper case letters all come before lower case ones.
# Expect: rows Q = [("Z",)]
V(w: "Z");
V(w: "a");
Q(w:) :- V(w:), w < "a";
