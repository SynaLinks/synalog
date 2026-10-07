# A conditional on a null test.
# Expect: rows Q = [(1, 'known'), (2, 'unknown'), (3, 'known'), (4, 'known'), (5, 'unknown')]
Person(id: 1, name: "ann", age: 30);
Person(id: 2, name: "bob", age: null);
Person(id: 3, name: "cid", age: 25);
Person(id: 4, name: null, age: 40);
Person(id: 5, name: "eve", age: null);
@OrderBy(Q, "id", "s");
Q(id:, s: if IsNull(age) then "unknown" else "known") :- Person(id:, age:);
