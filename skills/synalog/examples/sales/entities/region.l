---
name: Region
description: The regions sales are made in.
---
import tables.sales.Sales;

@OrderBy(Region, "region");
Region(region:) distinct :- Sales(region:);
