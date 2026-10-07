# A zero length gives empty text.
# Expect: rows Q = [("",)]
Q(s: Substr("hello", 2, 0));
