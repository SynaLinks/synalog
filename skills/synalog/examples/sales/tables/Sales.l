---
name: Sales
description: One row per sale, with its region, amount and time.
---
@OrderBy(Sales, "sold_at");
Sales(region:, amount:, sold_at:) :- sales(region:, amount:, sold_at:);
