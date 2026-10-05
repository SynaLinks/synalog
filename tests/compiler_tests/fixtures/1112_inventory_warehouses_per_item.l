# Test: In how many warehouses each item is. (from tests/programs/inventory/warehouses_per_item.l)

Stock(warehouse: "north", item: "bolt", qty: 120);
Stock(warehouse: "north", item: "nut", qty: 40);
Stock(warehouse: "north", item: "gear", qty: 5);
Stock(warehouse: "south", item: "bolt", qty: 30);
Stock(warehouse: "south", item: "gear", qty: 12);
Stock(warehouse: "south", item: "belt", qty: 7);
Stock(warehouse: "east", item: "nut", qty: 15);
Stock(warehouse: "east", item: "belt", qty: 2);
Stock(warehouse: "east", item: "chain", qty: 9);
Reorder(item: "bolt", level: 100);
Reorder(item: "nut", level: 60);
Reorder(item: "gear", level: 10);
Reorder(item: "belt", level: 10);
Reorder(item: "chain", level: 5);
Price(item: "bolt", cents: 2);
Price(item: "nut", cents: 1);
Price(item: "gear", cents: 25);
Price(item: "belt", cents: 14);
Price(item: "chain", cents: 30);
@OrderBy(N, "item", "n");
N(item:, n? += 1) distinct :- Stock(item:);
