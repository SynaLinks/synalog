# Test: A field of an element of a list of records. (from tests/programs/records3/list_of_records_element.l)

T(k: 1, l: [{n: "a", v: 1}, {n: "b", v: 2}]);
T(k: 2, l: [{n: "c", v: 3}]);
@OrderBy(Q, "k");
Q(k:, n: Element(l, 0).n) :- T(k:, l:);
