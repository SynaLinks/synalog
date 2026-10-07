# Test: A field named order. (from tests/programs/records3/keyword_field_order.l)

V(k: 1);
V(k: 2);
R(k:, r: {order: k * 2}) :- V(k:);
@OrderBy(Q, "k");
Q(k:, v: r.order) :- R(k:, r:);
