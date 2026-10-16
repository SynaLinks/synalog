---
name: TopRegion
description: The region with the highest total sales.
keywords: [best region]
---
import rules.total_by_region.TotalByRegion;

@OrderBy(TopRegion, "total DESC");
@Limit(TopRegion, 1);
TopRegion(region:, total:) :- TotalByRegion(region:, total:);
