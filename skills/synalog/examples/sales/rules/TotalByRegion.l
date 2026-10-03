---
name: TotalByRegion
description: Total sales amount per region, highest first.
keywords: [revenue, region]
---
import concepts.Region.Region;
import tables.Sales.Sales;

@OrderBy(TotalByRegion, "total", "DESC");
TotalByRegion(region:, total? += amount) distinct :- Region(region:), Sales(region:, amount:);
