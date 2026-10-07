# Fields holding quotes.
# Expect: rows Q = [("it's", 'say "hi"')]
R(r: {a: 'it\'s', b: 'say "hi"'});
Q(a: r.a, b: r.b) :- R(r:);
