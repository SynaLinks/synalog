# Test: Summing a list field by unnesting. (from tests/programs/records3/list_field_sum.l)

S(k: 1, r: {name: "a", xs: [1, 2, 3]});
S(k: 2, r: {name: "b", xs: [4]});
S(k: 3, r: {name: "c", xs: []});
@OrderBy(Q, "name");
Q(name: r.name, t? += x) distinct :- S(r:), x in r.xs;
