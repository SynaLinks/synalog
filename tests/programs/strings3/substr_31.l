# The first two characters of '😀ok'.
# Expect: rows Q = [('😀o',)]
Q(s: Substr("😀ok", 1, 2));
