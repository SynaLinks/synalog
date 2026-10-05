# Test: Books by authors austen influenced. (from tests/programs/library/books_downstream_of_austen.l)

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
Influenced(a: "austen", b: "tolkien");
Influenced(a: "tolkien", b: "herbert");
Influenced(a: "herbert", b: "gibson");
Influenced(a: "asimov", b: "herbert");
@Recursive(Down, 6);
Down(a:, b:) distinct :- Influenced(a:, b:);
Down(a:, b: c) distinct :- Down(a:, b:), Influenced(a: b, b: c);
@OrderBy(Q, "title");
Q(title:) :- Down(a: "austen", b: author), Book(title:, author:);
