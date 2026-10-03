# An implicit variable used only in a comparison is unbound: unsupported.
# Expect: status V.free unsupported
@Assert(V, free: "∀ x, V x → x < limit");
V(x:) :- x in [1, 2];
