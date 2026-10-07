# A separator of two characters.
# Expect: rows Q = [(["a", "b", "c"],)]
Q(parts: Split("a::b::c", "::"));
