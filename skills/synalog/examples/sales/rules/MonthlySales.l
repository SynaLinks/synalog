---
name: MonthlySales
description: Total sales amount per month (YYYY-MM).
keywords: [monthly, trend]
---
import tables.Sales.Sales;

# Temporal columns go through ToString -> Substr, never raw arithmetic.
@OrderBy(MonthlySales, "month");
MonthlySales(month:, total? += amount) distinct :-
  Sales(amount:, sold_at:),
  month == Substr(ToString(sold_at), 1, 7);
