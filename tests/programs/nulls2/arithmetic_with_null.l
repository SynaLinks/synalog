# Arithmetic with a null gives null.
# Expect: rows Q = [(1, 31), (2, None), (3, 26), (4, 41), (5, None)]
Person(id: 1, name: "ann", age: 30);
Person(id: 2, name: "bob", age: null);
Person(id: 3, name: "cid", age: 25);
Person(id: 4, name: null, age: 40);
Person(id: 5, name: "eve", age: null);
@OrderBy(Q, "id", "next");
Q(id:, next: age + 1) :- Person(id:, age:);
