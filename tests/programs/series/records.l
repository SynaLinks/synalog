# Days above every earlier day.
# Expect: rows R = [(1,), (2,), (4,), (5,), (8,), (9,), (12,)]
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
Beaten(day:) distinct :- Reading(day:, value: v), Reading(day: e, value: w), e < day, w >= v;
@OrderBy(R, "day");
R(day:) :- Reading(day:), ~Beaten(day:);
