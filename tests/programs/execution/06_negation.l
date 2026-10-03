# Negation keeps the rows with no match.
# Expect: rows Lonely = [("c",)]
Person(name:) :- name in ["a", "b", "c"];
Friend(a: "a", b: "b");
Friend(a: "b", b: "a");
@OrderBy(Lonely, "name");
Lonely(name:) :- Person(name:), ~Friend(a: name);
