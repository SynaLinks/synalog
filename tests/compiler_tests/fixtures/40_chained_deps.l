# Test: Chained predicate dependencies

# Base data
RawData(1, 10);
RawData(2, 20);
RawData(3, 30);
RawData(4, 40);
RawData(5, 50);

# Level 1: Filter
Filtered(id, val) :- RawData(id, val), val > 15;

# Level 2: Transform
Transformed(id, doubled) :-
  Filtered(id, val),
  doubled == val * 2;

# Level 3: Aggregate
Aggregated(total? += doubled, count? += 1) distinct :-
  Transformed(id, doubled);

# Level 4: Compute
FinalStats(total, count, avg) :-
  Aggregated(total:, count:),
  avg == total / count;

# Parallel chain
AltTransformed(id, halved) :-
  Filtered(id, val),
  halved == val / 2;

AltAggregated(alt_total? += halved) distinct :-
  AltTransformed(id, halved);

# Merge chains
Combined(main_total, alt_total, ratio) :-
  Aggregated(total: main_total, count:),
  AltAggregated(alt_total:),
  ratio == main_total / alt_total;

@OrderBy(Test, "total");
Test(total:, count:, avg:) :- FinalStats(total, count, avg);
