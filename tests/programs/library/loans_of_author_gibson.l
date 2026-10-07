# How many loans of gibson's books.
# Expect: rows Q = [(2,)]
Book(id: 1, title: "The Hobbit", author: "tolkien", year: 1937);
Book(id: 2, title: "The Fellowship", author: "tolkien", year: 1954);
Book(id: 3, title: "The Two Towers", author: "tolkien", year: 1954);
Book(id: 4, title: "Dune", author: "herbert", year: 1965);
Book(id: 5, title: "Dune Messiah", author: "herbert", year: 1969);
Book(id: 6, title: "Emma", author: "austen", year: 1815);
Book(id: 7, title: "Persuasion", author: "austen", year: 1817);
Book(id: 8, title: "Neuromancer", author: "gibson", year: 1984);
Book(id: 9, title: "Count Zero", author: "gibson", year: 1986);
Book(id: 10, title: "Foundation", author: "asimov", year: 1951);
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
Q(n? += 1) distinct :- Loan(book:), Book(id: book, author: "gibson");
