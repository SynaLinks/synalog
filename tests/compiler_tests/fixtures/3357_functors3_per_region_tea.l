# Test: tea sales per region, by a generic grouped total. (from tests/programs/functors3/per_region_tea.l)

Sale(id: 1, region: "north", product: "tea", amount: 120);
Sale(id: 2, region: "north", product: "cake", amount: 40);
Sale(id: 3, region: "south", product: "tea", amount: 75);
Sale(id: 4, region: "south", product: "coffee", amount: 210);
Sale(id: 5, region: "east", product: "cake", amount: 55);
Sale(id: 6, region: "east", product: "tea", amount: 130);
Sale(id: 7, region: "north", product: "coffee", amount: 95);
Sale(id: 8, region: "south", product: "cake", amount: 20);
Src(id: 0, region: "x", amount: 0);
PerRegion(region:, t? += amount) distinct :- Src(region:, amount:);
F(id:, region:, amount:) :- Sale(id:, region:, product: "tea", amount:);
R := PerRegion(Src: F);
@OrderBy(Q, "region");
Q(region:, t:) :- R(region:, t:);
