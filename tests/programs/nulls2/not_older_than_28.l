# Nor does its opposite.
# Expect: rows Q = [(3,)]
Person(id: 1, name: "ann", age: 30);
Person(id: 2, name: "bob", age: null);
Person(id: 3, name: "cid", age: 25);
Person(id: 4, name: null, age: 40);
Person(id: 5, name: "eve", age: null);
Q(id:) :- Person(id:, age:), age <= 28;
