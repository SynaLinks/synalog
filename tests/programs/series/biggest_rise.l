# The largest day-over-day rise.
# Expect: rows B = [(8,)]
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
Delta(day:, delta: v - p) :- Reading(day:, value: v), Reading(day: q, value: p), q == day - 1;
B(m? Max= delta) distinct :- Delta(delta:);
