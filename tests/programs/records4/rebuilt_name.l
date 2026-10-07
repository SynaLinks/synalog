# A field of a record built from a field.
# Expect: rows Q = [(1, 'ann'), (2, 'bob'), (3, 'cid'), (4, 'dee'), (5, 'eve')]
P(id: 1, r: {name: "ann", home: {city: "paris"}, age: 31, tags: ["a", "b"]});
P(id: 2, r: {name: "bob", home: {city: "oslo"}, age: null, tags: []});
P(id: 3, r: {name: "cid", home: {city: "paris"}, age: 45, tags: ["c"]});
P(id: 4, r: {name: "dee", home: {city: null}, age: 22, tags: ["a"]});
P(id: 5, r: {name: "eve", home: {city: "rome"}, age: 38, tags: ["b", "c", "d"]});
@OrderBy(Q, "id");
Q(id:, v: {n: r.name}.n) :- P(id:, r:);
