# Test: Grouping by a column from a joined predicate. (from tests/programs/aggregates/28_group_key_from_a_join.l)

Region(c: "fr", r: "eu");
Region(c: "de", r: "eu");
Region(c: "ca", r: "us");
Sale(c: "fr", x: 10);
Sale(c: "de", x: 20);
Sale(c: "ca", x: 5);
@OrderBy(A, "r");
A(r:, t? += x) distinct :- Sale(c:, x:), Region(c:, r:);
