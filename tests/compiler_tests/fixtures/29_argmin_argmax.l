# Test: ArgMin/ArgMax edge cases

# Sales data
Sales("North", "Q1", 100);
Sales("North", "Q2", 150);
Sales("North", "Q3", 120);
Sales("South", "Q1", 200);
Sales("South", "Q2", 180);
Sales("South", "Q3", 220);
Sales("East", "Q1", 90);
Sales("East", "Q2", 110);
Sales("East", "Q3", 95);

# Best quarter per region (ArgMax)
BestQuarter(region, best_quarter? ArgMax= quarter -> amount) distinct :-
  Sales(region, quarter, amount);

# Worst quarter per region (ArgMin)
WorstQuarter(region, worst_quarter? ArgMin= quarter -> amount) distinct :-
  Sales(region, quarter, amount);

# Max amount per region
MaxSales(region, max_amount? Max= amount) distinct :-
  Sales(region, quarter, amount);

# Combined: region with best quarter and its amount
RegionBest(region, best_q, max_amt) :-
  BestQuarter(region, best_quarter: best_q),
  MaxSales(region, max_amount: max_amt);

@OrderBy(Test, "region");
Test(region:, best_quarter:) :- BestQuarter(region, best_quarter:);
