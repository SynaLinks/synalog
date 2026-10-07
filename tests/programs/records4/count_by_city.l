# People per city: a nested field as a group key; the null city left out.
# Expect: rows Q = [('oslo', 1), ('paris', 2), ('rome', 1)]
P(id: 1, r: {name: "ann", home: {city: "paris"}, age: 31, tags: ["a", "b"]});
P(id: 2, r: {name: "bob", home: {city: "oslo"}, age: null, tags: []});
P(id: 3, r: {name: "cid", home: {city: "paris"}, age: 45, tags: ["c"]});
P(id: 4, r: {name: "dee", home: {city: null}, age: 22, tags: ["a"]});
P(id: 5, r: {name: "eve", home: {city: "rome"}, age: 38, tags: ["b", "c", "d"]});
@OrderBy(Q, "city");
Q(city: r.home.city, n? += 1) distinct :- P(r:), r.home.city is not null;
