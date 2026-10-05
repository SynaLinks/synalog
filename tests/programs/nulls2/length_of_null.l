# The length of a null is null.
# Expect: rows Q = [(1, 3), (2, 3), (3, 3), (4, None), (5, 3)]
Person(id: 1, name: "ann", age: 30);
Person(id: 2, name: "bob", age: null);
Person(id: 3, name: "cid", age: 25);
Person(id: 4, name: null, age: 40);
Person(id: 5, name: "eve", age: null);
@OrderBy(Q, "id", "n");
Q(id:, n: Length(name)) :- Person(id:, name:);
