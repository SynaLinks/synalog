# Coalesce makes a null key join.
# Expect: rows J = [("a", "default")]
A(k: null, v: "a");
B(k: "none", w: "default");
J(v:, w:) :- A(k:, v:), B(k: Coalesce(k, "none"), w:);
