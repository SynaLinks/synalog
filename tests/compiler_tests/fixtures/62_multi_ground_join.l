# Test: multiple @Ground tables, downstream predicate joins two of them

Sales("Q1", "North", 100);
Sales("Q1", "South", 150);
Sales("Q2", "North", 120);
Sales("Q2", "South", 180);

# First grounded predicate: total per quarter.
@Ground(QuarterTotals);
QuarterTotals(quarter, total? += amount) distinct :- Sales(quarter, region, amount);

# Second grounded predicate: total per region.
@Ground(RegionTotals);
RegionTotals(region, total? += amount) distinct :- Sales(quarter, region, amount);

# Downstream predicate that JOINS both grounded tables: every sale annotated
# with its quarter total and its region total. Forces both @Ground tables to
# materialize and be read from.
@OrderBy(Share, "quarter", "region");
Share(quarter:, region:, qtotal:, rtotal:) :-
  Sales(quarter, region, amount),
  QuarterTotals(quarter, total: qtotal),
  RegionTotals(region, total: rtotal);
