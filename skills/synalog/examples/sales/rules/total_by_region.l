---
name: TotalByRegion
description: Total sales amount per region, highest first.
keywords: [revenue, region]
---
import entities.region.Region;
import tables.sales.Sales;

@OrderBy(TotalByRegion, "total", "DESC");
TotalByRegion(region:, total? += amount) distinct :- Region(region:), Sales(region:, amount:);
