# Test: A list of records in a record. (from tests/programs/records3/records_in_a_list_field.l)

T(r: {name: "a", items: [{n: "p"}, {n: "q"}]});
T(r: {name: "b", items: [{n: "r"}]});
@OrderBy(Q, "name", "item");
Q(name: r.name, item: i.n) :- T(r:), i in r.items;
