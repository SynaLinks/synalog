# Splitting 'a::b::c' at '::'.
# Expect: rows Q = [(3,)]
Q(n: Size(Split("a::b::c", "::")));
