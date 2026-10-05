# Test: Parts no other part uses. (from tests/programs/bom/top_level_parts.l)

Uses(part: "bike", component: "frame", qty: 1);
Uses(part: "bike", component: "wheel", qty: 2);
Uses(part: "wheel", component: "rim", qty: 1);
Uses(part: "wheel", component: "spoke", qty: 32);
Uses(part: "wheel", component: "hub", qty: 1);
Uses(part: "hub", component: "bearing", qty: 2);
Uses(part: "frame", component: "tube", qty: 3);
Uses(part: "scooter", component: "wheel", qty: 2);
Uses(part: "scooter", component: "deck", qty: 1);
Part(part:) distinct :- Uses(part:) | Uses(component: part);
@OrderBy(R, "part");
R(part:) :- Part(part:), ~Uses(component: part);
