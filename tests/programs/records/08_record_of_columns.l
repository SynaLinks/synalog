# A record built from columns, then read.
# Expect: rows R = [(3,)]
V(x: 1, y: 2);
W(r: {x:, y:}) :- V(x:, y:);
R(t: r.x + r.y) :- W(r:);
