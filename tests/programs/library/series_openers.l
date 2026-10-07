# Books that open a series.
# Expect: rows Q = [(1,), (4,), (8,)]
Sequel(book: 2, next: 3);
Sequel(book: 4, next: 5);
Sequel(book: 8, next: 9);
Sequel(book: 1, next: 2);
IsSequel(book: next) distinct :- Sequel(next:);
@OrderBy(Q, "book");
Q(book:) distinct :- Sequel(book:), ~IsSequel(book:);
