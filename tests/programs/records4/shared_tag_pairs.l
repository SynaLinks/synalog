# Pairs sharing a tag.
# Expect: rows Q = [(1, 4), (1, 5), (3, 5)]
P(id: 1, r: {name: "ann", home: {city: "paris"}, age: 31, tags: ["a", "b"]});
P(id: 2, r: {name: "bob", home: {city: "oslo"}, age: null, tags: []});
P(id: 3, r: {name: "cid", home: {city: "paris"}, age: 45, tags: ["c"]});
P(id: 4, r: {name: "dee", home: {city: null}, age: 22, tags: ["a"]});
P(id: 5, r: {name: "eve", home: {city: "rome"}, age: 38, tags: ["b", "c", "d"]});
@OrderBy(Q, "a", "b");
Q(a:, b:) distinct :- P(id: a, r: x), P(id: b, r: y), a < b, t in x.tags, t in y.tags;
