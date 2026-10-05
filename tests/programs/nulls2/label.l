# A label with a default name.
# Expect: rows Q = [(1, 'ann'), (2, 'bob'), (3, 'cid'), (4, '?'), (5, 'eve')]
Person(id: 1, name: "ann", age: 30);
Person(id: 2, name: "bob", age: null);
Person(id: 3, name: "cid", age: 25);
Person(id: 4, name: null, age: 40);
Person(id: 5, name: "eve", age: null);
@OrderBy(Q, "id", "label");
Q(id:, label: Coalesce(name, "?")) :- Person(id:, name:);
