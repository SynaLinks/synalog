# Test: Function-like predicates (simplified)
@Engine("psql");

# Using inline computation instead of UDFs
Source(x) :- x in Range(5);

# Inline computation as an alternative to UDFs
Computed(x, doubled, tripled) :- Source(x), doubled == 2 * x, tripled == 3 * x;

@OrderBy(Test, "col0");
Test(x, doubled, tripled) :- Computed(x, doubled, tripled);
