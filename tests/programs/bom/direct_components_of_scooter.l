# What scooter uses directly, with quantities.
# Expect: rows D = [('deck', 1), ('wheel', 2)]
Uses(part: "bike", component: "frame", qty: 1);
Uses(part: "bike", component: "wheel", qty: 2);
Uses(part: "wheel", component: "rim", qty: 1);
Uses(part: "wheel", component: "spoke", qty: 32);
Uses(part: "wheel", component: "hub", qty: 1);
Uses(part: "hub", component: "bearing", qty: 2);
Uses(part: "frame", component: "tube", qty: 3);
Uses(part: "scooter", component: "wheel", qty: 2);
Uses(part: "scooter", component: "deck", qty: 1);
@OrderBy(D, "component");
D(component:, qty:) :- Uses(part: "scooter", component:, qty:);
