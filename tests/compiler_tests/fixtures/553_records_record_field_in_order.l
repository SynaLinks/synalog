# Test: Ordering by a field read from a record. (from tests/programs/records/12_record_field_in_order.l)

V(r: {k: 2});
V(r: {k: 1});
@OrderBy(R, "k");
R(k: r.k) :- V(r:);
