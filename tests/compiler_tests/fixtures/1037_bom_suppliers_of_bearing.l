# Test: The suppliers bearing depends on, itself included. (from tests/programs/bom/suppliers_of_bearing.l)

Uses(part: "bike", component: "frame", qty: 1);
Uses(part: "bike", component: "wheel", qty: 2);
Uses(part: "wheel", component: "rim", qty: 1);
Uses(part: "wheel", component: "spoke", qty: 32);
Uses(part: "wheel", component: "hub", qty: 1);
Uses(part: "hub", component: "bearing", qty: 2);
Uses(part: "frame", component: "tube", qty: 3);
Uses(part: "scooter", component: "wheel", qty: 2);
Uses(part: "scooter", component: "deck", qty: 1);
Supplies(component: "rim", supplier: "acme");
Supplies(component: "spoke", supplier: "acme");
Supplies(component: "bearing", supplier: "bolt");
Supplies(component: "tube", supplier: "steelco");
Supplies(component: "deck", supplier: "steelco");
Supplies(component: "hub", supplier: "bolt");
@Recursive(Contains, 6);
Contains(part:, component:) distinct :- Uses(part:, component:);
Contains(part:, component: c) distinct :- Contains(part:, component:), Uses(part: component, component: c);
@OrderBy(S, "supplier");
S(supplier:) distinct :- Contains(part: "bearing", component:), Supplies(component:, supplier:) | Supplies(component: "bearing", supplier:);
