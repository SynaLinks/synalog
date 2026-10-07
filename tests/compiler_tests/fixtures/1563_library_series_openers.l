# Test: Books that open a series. (from tests/programs/library/series_openers.l)

Sequel(book: 2, next: 3);
Sequel(book: 4, next: 5);
Sequel(book: 8, next: 9);
Sequel(book: 1, next: 2);
IsSequel(book: next) distinct :- Sequel(next:);
@OrderBy(Q, "book");
Q(book:) distinct :- Sequel(book:), ~IsSequel(book:);
