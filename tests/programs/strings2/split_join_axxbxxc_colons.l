# Splitting then joining 'a::b::c' gives it back.
# Expect: rows Q = [('a::b::c',)]
Q(s: Join(Split("a::b::c", "::"), "::"));
