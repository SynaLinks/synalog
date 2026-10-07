# The age, or 0.
# Expect: rows Q = [(1, 30), (2, 0), (3, 25), (4, 40), (5, 0)]
Person(id: 1, name: "ann", age: 30);
Person(id: 2, name: "bob", age: null);
Person(id: 3, name: "cid", age: 25);
Person(id: 4, name: null, age: 40);
Person(id: 5, name: "eve", age: null);
@OrderBy(Q, "id", "age");
Q(id:, age: Coalesce(age, 0)) :- Person(id:, age:);
