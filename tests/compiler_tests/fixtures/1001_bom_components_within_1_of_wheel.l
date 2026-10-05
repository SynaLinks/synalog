# Test: wheel's components at most 1 level(s) down. (from tests/programs/bom/components_within_1_of_wheel.l)

Uses(part: "bike", component: "frame", qty: 1);
Uses(part: "bike", component: "wheel", qty: 2);
Uses(part: "wheel", component: "rim", qty: 1);
Uses(part: "wheel", component: "spoke", qty: 32);
Uses(part: "wheel", component: "hub", qty: 1);
Uses(part: "hub", component: "bearing", qty: 2);
Uses(part: "frame", component: "tube", qty: 3);
Uses(part: "scooter", component: "wheel", qty: 2);
Uses(part: "scooter", component: "deck", qty: 1);
@Recursive(Down, 1);
Down(component:) distinct :- Uses(part: "wheel", component:);
Down(component: c) distinct :- Down(component:), Uses(part: component, component: c);
@OrderBy(C, "component");
C(component:) distinct :- Down(component:);
