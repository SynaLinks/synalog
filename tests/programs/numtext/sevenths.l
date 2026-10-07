# Whole numbers divided by 7: computed doubles, the same text everywhere.
# Expect: rows Q = [(1, '0.142857142857143'), (22, '3.14285714285714'), (100, '14.2857142857143'), (355, '50.7142857142857'), (1000000, '142857.142857143'), (123456789, '17636684.1428571')]
W(n: 1);
W(n: 22);
W(n: 100);
W(n: 355);
W(n: 1000000);
W(n: 123456789);
@OrderBy(Q, "n");
Q(n:, t: ToString(n / 7)) :- W(n:);
