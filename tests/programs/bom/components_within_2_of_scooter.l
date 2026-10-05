# scooter's components at most 2 level(s) down.
# Expect: rows C = [('bearing',), ('deck',), ('hub',), ('rim',), ('spoke',), ('wheel',)]
Uses(part: "bike", component: "frame", qty: 1);
Uses(part: "bike", component: "wheel", qty: 2);
Uses(part: "wheel", component: "rim", qty: 1);
Uses(part: "wheel", component: "spoke", qty: 32);
Uses(part: "wheel", component: "hub", qty: 1);
Uses(part: "hub", component: "bearing", qty: 2);
Uses(part: "frame", component: "tube", qty: 3);
Uses(part: "scooter", component: "wheel", qty: 2);
Uses(part: "scooter", component: "deck", qty: 1);
@Recursive(Down, 2);
Down(component:) distinct :- Uses(part: "scooter", component:);
Down(component: c) distinct :- Down(component:), Uses(part: component, component: c);
@OrderBy(C, "component");
C(component:) distinct :- Down(component:);
