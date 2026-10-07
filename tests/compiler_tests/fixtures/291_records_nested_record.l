# Test: A field of a nested record. (from tests/programs/records/02_nested_record.l)

R(r: {outer: {inner: "deep"}});
X(v:) :- R(r:), v == r.outer.inner;
