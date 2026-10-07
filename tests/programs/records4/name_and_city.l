# Fields joined as text; null for a null city.
# Expect: rows Q = [(1, 'ann@paris'), (2, 'bob@oslo'), (3, 'cid@paris'), (4, None), (5, 'eve@rome')]
P(id: 1, r: {name: "ann", home: {city: "paris"}, age: 31, tags: ["a", "b"]});
P(id: 2, r: {name: "bob", home: {city: "oslo"}, age: null, tags: []});
P(id: 3, r: {name: "cid", home: {city: "paris"}, age: 45, tags: ["c"]});
P(id: 4, r: {name: "dee", home: {city: null}, age: 22, tags: ["a"]});
P(id: 5, r: {name: "eve", home: {city: "rome"}, age: 38, tags: ["b", "c", "d"]});
@OrderBy(Q, "id");
Q(id:, v: r.name ++ "@" ++ r.home.city) :- P(id:, r:);
