# Loans returned more than a month after.
# Expect: rows Q = [('ana', 4), ('ben', 6), ('cy', 8)]
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
@OrderBy(Q, "member", "book");
Q(member:, book:) :- Loan(member:, book:, out:, back:),
  back > Substr(out, 1, 5) ++ (if Substr(out, 6, 2) == "01" then "02" else if Substr(out, 6, 2) == "02" then "03"
    else if Substr(out, 6, 2) == "03" then "04" else "05") ++ Substr(out, 8, 3);
