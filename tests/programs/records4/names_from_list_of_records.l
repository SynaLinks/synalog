# The names read back from a collected list of records.
# Expect: rows Q = [('oslo', 'bob'), ('paris', 'ann'), ('paris', 'cid'), ('rome', 'eve')]
P(id: 1, r: {name: "ann", home: {city: "paris"}, age: 31, tags: ["a", "b"]});
P(id: 2, r: {name: "bob", home: {city: "oslo"}, age: null, tags: []});
P(id: 3, r: {name: "cid", home: {city: "paris"}, age: 45, tags: ["c"]});
P(id: 4, r: {name: "dee", home: {city: null}, age: 22, tags: ["a"]});
P(id: 5, r: {name: "eve", home: {city: "rome"}, age: 38, tags: ["b", "c", "d"]});
L(city: r.home.city, l? List= {n: r.name}) distinct :- P(r:), r.home.city is not null;
@OrderBy(Q, "city", "n");
Q(city:, n: e.n) :- L(city:, l:), e in l;
