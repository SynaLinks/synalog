# Who borrowed book 10.
# Expect: rows Q = [('cy',)]
Loan(member: "ana", book: 1, out: "2026-01-03", back: "2026-01-20");
Loan(member: "ana", book: 4, out: "2026-02-01", back: "2026-03-15");
Loan(member: "ben", book: 4, out: "2026-01-10", back: "2026-01-12");
Loan(member: "ben", book: 5, out: "2026-02-11", back: "2026-02-25");
Loan(member: "ben", book: 6, out: "2026-03-01", back: "2026-04-02");
Loan(member: "cy", book: 8, out: "2026-01-05", back: "2026-02-28");
Loan(member: "cy", book: 9, out: "2026-03-01", back: "2026-03-09");
Loan(member: "cy", book: 10, out: "2026-03-03", back: "2026-03-04");
Loan(member: "ana", book: 2, out: "2026-03-20", back: "2026-03-30");
Loan(member: "ana", book: 3, out: "2026-04-01", back: "2026-04-10");
Q(member:) distinct :- Loan(member:, book: 10);
