# The average skips nulls.
# Expect: rows Q = [(31.666666666666668,)]
Person(id: 1, name: "ann", age: 30);
Person(id: 2, name: "bob", age: null);
Person(id: 3, name: "cid", age: 25);
Person(id: 4, name: null, age: 40);
Person(id: 5, name: "eve", age: null);
Q(a? Avg= age) distinct :- Person(age:);
