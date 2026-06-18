# Reusable metrics over the sales table. Import from programs at the
# example root with:
#   import lib.metrics.TotalByRegion;

@OrderBy(TotalByRegion, "total", "DESC");
TotalByRegion(region:, total? += amount) distinct :- sales(region:, amount:);
