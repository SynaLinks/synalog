# Test: @Ground annotation for materialization

# Base data
Sales("Q1", "North", 100);
Sales("Q1", "South", 150);
Sales("Q2", "North", 120);
Sales("Q2", "South", 180);
Sales("Q3", "North", 110);
Sales("Q3", "South", 160);

# Ground predicate - computed first
@Ground(QuarterTotals);
QuarterTotals(quarter, total? += amount) distinct :- Sales(quarter, region, amount);

# Ground predicate - region totals
@Ground(RegionTotals);
RegionTotals(region, total? += amount) distinct :- Sales(quarter, region, amount);

# Uses grounded predicates
QuarterComparison(quarter, qtotal, avg_region) :-
  QuarterTotals(quarter, total: qtotal),
  avg_region == qtotal / 2;

# Cross-reference grounded predicates
Summary(quarter, region, qpct) :-
  Sales(quarter, region, amount),
  QuarterTotals(quarter, total: qtotal),
  qpct == amount * 100 / qtotal;

@OrderBy(Test, "quarter");
Test(quarter:, total:) :- QuarterTotals(quarter, total:);
