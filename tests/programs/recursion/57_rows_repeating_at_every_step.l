# A recursion that is not distinct holds a multiset: every step adds a row
# whose value an earlier step already found, so the rows repeat, and their
# count grows with each step up to the depth (one row, then 30 steps).
# Expect: rows BagCount = [(31,)]
@Recursive(AuditBag, 30);
AuditBag(x: 1);
AuditBag(x: 3 - y) :- AuditBag(x: y);
BagCount(n? += 1) distinct :- AuditBag(x:);
