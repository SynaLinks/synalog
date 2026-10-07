# A record built in a head for the people of rome, read in another predicate.
# Expect: rows Q = [('eve', 'rome')]
P(id: 1, r: {name: "ann", home: {city: "paris"}, age: 31, tags: ["a", "b"]});
P(id: 2, r: {name: "bob", home: {city: "oslo"}, age: null, tags: []});
P(id: 3, r: {name: "cid", home: {city: "paris"}, age: 45, tags: ["c"]});
P(id: 4, r: {name: "dee", home: {city: null}, age: 22, tags: ["a"]});
P(id: 5, r: {name: "eve", home: {city: "rome"}, age: 38, tags: ["b", "c", "d"]});
H(h: {who: r.name, at: r.home}) :- P(r:), r.home.city == "rome";
@OrderBy(Q, "w");
Q(w: h.who, c: h.at.city) :- H(h:);
