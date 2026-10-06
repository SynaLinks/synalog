# Test: Fields holding quotes. (from tests/programs/records3/string_field_with_quotes.l)

R(r: {a: 'it\'s', b: 'say "hi"'});
Q(a: r.a, b: r.b) :- R(r:);
