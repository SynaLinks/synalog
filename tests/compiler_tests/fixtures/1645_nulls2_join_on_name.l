# Test: Null names join nothing. (from tests/programs/nulls2/join_on_name.l)

Person(id: 1, name: "ann", age: 30);
Person(id: 2, name: "bob", age: null);
Person(id: 3, name: "cid", age: 25);
Person(id: 4, name: null, age: 40);
Person(id: 5, name: "eve", age: null);
Role(name: "ann", role: "admin");
Role(name: "cid", role: "user");
Role(name: null, role: "ghost");
@OrderBy(Q, "id", "role");
Q(id:, role:) :- Person(id:, name:), Role(name:, role:);
