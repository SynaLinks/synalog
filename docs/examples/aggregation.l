# run: Stats, PriceStats, UniqueRegions, TopSeller
@Engine("duckdb");

# Tables
Sales(category: "books", region: "eu", seller: "ann", amount: 120);
Sales(category: "books", region: "us", seller: "bob", amount: 80);
Sales(category: "games", region: "eu", seller: "ann", amount: 300);
Sales(category: "games", region: "eu", seller: "cid", amount: 150);
Sales(category: "games", region: "us", seller: "bob", amount: 220);

# Rules

## Sum and count per category. Non-aggregated columns form the grouping key.
@OrderBy(Stats, "category");
Stats(category:, total? += amount, count? += 1) distinct :- Sales(category:, amount:);

## Min, max and average.
@OrderBy(PriceStats, "category");
PriceStats(category:, lo? Min= amount, hi? Max= amount, avg? Avg= amount) distinct :-
  Sales(category:, amount:);

## Collect distinct values into an array.
@OrderBy(UniqueRegions, "category");
UniqueRegions(category:, regions? Set= region) distinct :- Sales(category:, region:);

## The seller with the highest total revenue.
@OrderBy(SellerRevenue, "seller");
SellerRevenue(seller:, revenue? += amount) distinct :- Sales(seller:, amount:);

TopSeller(name? ArgMax= seller -> revenue) distinct :- SellerRevenue(seller:, revenue:);
