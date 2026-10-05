# A sequel never appears before its book.
# Expect: holds Pub.later
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
Sequel(book: 2, next: 3);
Sequel(book: 4, next: 5);
Sequel(book: 8, next: 9);
Sequel(book: 1, next: 2);
Pub(book:, next:, y1:, y2:) :- Sequel(book:, next:), Book(id: book, year: y1), Book(id: next, year: y2);
@Assert(Pub, later: "∀ b n y z, Pub b n y z → y ≤ z");
