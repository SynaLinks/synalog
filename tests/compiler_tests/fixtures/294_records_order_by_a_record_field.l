# Test: Ordering by a value taken from a record. (from tests/programs/records/05_order_by_a_record_field.l)

R(r: {k: 2});
R(r: {k: 1});
@OrderBy(O, "k");
O(k:) :- R(r:), k == r.k;
