# How many bearings one wheel needs, multiplying along the tree.
# Expect: rows Q = [(2,)]
Uses(part: "bike", component: "frame", qty: 1);
Uses(part: "bike", component: "wheel", qty: 2);
Uses(part: "wheel", component: "rim", qty: 1);
Uses(part: "wheel", component: "spoke", qty: 32);
Uses(part: "wheel", component: "hub", qty: 1);
Uses(part: "hub", component: "bearing", qty: 2);
Uses(part: "frame", component: "tube", qty: 3);
Uses(part: "scooter", component: "wheel", qty: 2);
Uses(part: "scooter", component: "deck", qty: 1);
@Recursive(Need, 6);
Need(part:, component:, path_id:, n:) distinct :- Uses(part:, component:, qty: n), path_id == component;
Need(part:, component: c, path_id:, n:) distinct :- Need(part:, component:, path_id: p0, n: m), Uses(part: component, component: c, qty: k), n == m * k, path_id == p0 ++ "/" ++ c;
Q(q? += n) distinct :- Need(part: "wheel", component: "bearing", n:);
