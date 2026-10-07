# A field of a nested record.
# Expect: rows X = [("deep",)]
R(r: {outer: {inner: "deep"}});
X(v:) :- R(r:), v == r.outer.inner;
