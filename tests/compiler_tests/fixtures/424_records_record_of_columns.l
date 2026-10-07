# Test: A record built from columns, then read. (from tests/programs/records/08_record_of_columns.l)

V(x: 1, y: 2);
W(r: {x:, y:}) :- V(x:, y:);
R(t: r.x + r.y) :- W(r:);
