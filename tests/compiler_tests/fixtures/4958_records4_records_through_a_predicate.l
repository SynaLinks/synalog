# Test: Records rebuilt in one predicate, read in another. (from tests/programs/records4/records_through_a_predicate.l)

P(id: 1, r: {name: "ann", home: {city: "paris"}, age: 31, tags: ["a", "b"]});
P(id: 2, r: {name: "bob", home: {city: "oslo"}, age: null, tags: []});
P(id: 3, r: {name: "cid", home: {city: "paris"}, age: 45, tags: ["c"]});
P(id: 4, r: {name: "dee", home: {city: null}, age: 22, tags: ["a"]});
P(id: 5, r: {name: "eve", home: {city: "rome"}, age: 38, tags: ["b", "c", "d"]});
R(id:, s: {u: Upper(r.name), n: Size(r.tags)}) :- P(id:, r:);
@OrderBy(Q, "id");
Q(id:, u: s.u, n: s.n) :- R(id:, s:);
