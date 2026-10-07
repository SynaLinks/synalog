# Test: How many distinct known ages. (from tests/programs/nulls2/distinct_known_ages.l)

Person(id: 1, name: "ann", age: 30);
Person(id: 2, name: "bob", age: null);
Person(id: 3, name: "cid", age: 25);
Person(id: 4, name: null, age: 40);
Person(id: 5, name: "eve", age: null);
Age(age:) distinct :- Person(age:), ~IsNull(age);
Q(n? += 1) distinct :- Age(age:);
