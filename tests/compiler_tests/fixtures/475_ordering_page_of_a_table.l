# Test: A page of a predicate read from a table, in order. (from tests/programs/ordering/11_page_of_a_table.l)

T(k: "d", v: 4);
T(k: "a", v: 1);
T(k: "c", v: 3);
T(k: "b", v: 2);
@OrderBy(O, "k");
O(k:, v:) :- T(k:, v:);
