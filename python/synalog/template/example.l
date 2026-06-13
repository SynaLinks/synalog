# Starter Synalog program. Validate, then run:
#   synalog example.l check
#   synalog example.l run TopRegion MonthlySales --load sales=data/sales.csv

@Engine("duckdb");

# Reusable predicates live in lib/ modules and are imported where needed.
import lib.metrics.TotalByRegion;

# Tables (read-only declarations of external data)
Sales(region:, amount:, sold_at:) :- sales(region:, amount:, sold_at:);

# Concepts — extract entities and relationships
@OrderBy(Region, "region");
Region(region:) distinct :- Sales(region:);

# Rules — derive insights from concepts and imported predicates
@OrderBy(MonthlySales, "month");
MonthlySales(month:, total? += amount) distinct :-
  Sales(amount:, sold_at:),
  month == Substr(ToString(sold_at), 1, 7);

@OrderBy(TopRegion, "total DESC");
@Limit(TopRegion, 1);
TopRegion(region:, total:) :- TotalByRegion(region:, total:);
