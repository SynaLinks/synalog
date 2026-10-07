# Test: The age, or 0. (from tests/programs/nulls2/age_or_zero.l)

Person(id: 1, name: "ann", age: 30);
Person(id: 2, name: "bob", age: null);
Person(id: 3, name: "cid", age: 25);
Person(id: 4, name: null, age: 40);
Person(id: 5, name: "eve", age: null);
@OrderBy(Q, "id", "age");
Q(id:, age: Coalesce(age, 0)) :- Person(id:, age:);
