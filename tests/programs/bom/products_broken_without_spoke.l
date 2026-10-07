# The products that break if spoke is discontinued.
# Expect: rows B = [('bike',), ('scooter',)]
Uses(part: "bike", component: "frame", qty: 1);
Uses(part: "bike", component: "wheel", qty: 2);
Uses(part: "wheel", component: "rim", qty: 1);
Uses(part: "wheel", component: "spoke", qty: 32);
Uses(part: "wheel", component: "hub", qty: 1);
Uses(part: "hub", component: "bearing", qty: 2);
Uses(part: "frame", component: "tube", qty: 3);
Uses(part: "scooter", component: "wheel", qty: 2);
Uses(part: "scooter", component: "deck", qty: 1);
Product(part: "bike");
Product(part: "scooter");
@Recursive(Contains, 6);
Contains(part:, component:) distinct :- Uses(part:, component:);
Contains(part:, component: c) distinct :- Contains(part:, component:), Uses(part: component, component: c);
@OrderBy(B, "part");
B(part:) distinct :- Product(part:), Contains(part:, component: "spoke");
