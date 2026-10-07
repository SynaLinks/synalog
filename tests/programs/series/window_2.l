# A 2-day moving total.
# Expect: rows W = [(2, 22), (3, 23), (4, 26), (5, 33), (6, 36), (7, 32), (8, 34), (9, 45), (10, 47), (11, 44), (12, 52)]
Reading(day: 1, value: 10);
Reading(day: 2, value: 12);
Reading(day: 3, value: 11);
Reading(day: 4, value: 15);
Reading(day: 5, value: 18);
Reading(day: 6, value: 18);
Reading(day: 7, value: 14);
Reading(day: 8, value: 20);
Reading(day: 9, value: 25);
Reading(day: 10, value: 22);
Reading(day: 11, value: 22);
Reading(day: 12, value: 30);
@OrderBy(W, "day", "total");
W(day:, total: a + b) :- Reading(day:, value: a), Reading(day: q, value: b), q == day - 1;
