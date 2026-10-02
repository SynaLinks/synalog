# Test: a functor applied to an imported predicate.
# The imported module prefixes its predicates (Segment becomes
# Segments_Segment); the functor's argument still names Segment and must
# reach it. Revenue is the enterprise customer's only: 100, not 107.

import lib.segments.Customer;
import lib.segments.SegmentRevenue;

Enterprise(customer_id:) distinct :- Customer(customer_id:, tier: "enterprise");

EnterpriseRevenue := SegmentRevenue(Segment: Enterprise);

@OrderBy(Test, "revenue");
Test(revenue:) :- EnterpriseRevenue(revenue:);
