# The length of each series.
# Expect: rows Q = [(1, 3), (4, 2), (8, 2)]
Sequel(book: 2, next: 3);
Sequel(book: 4, next: 5);
Sequel(book: 8, next: 9);
Sequel(book: 1, next: 2);
@Recursive(After, 6);
After(book:, next:) distinct :- Sequel(book:, next:);
After(book:, next: n) distinct :- After(book:, next:), Sequel(book: next, next: n);
IsSequel(book: next) distinct :- Sequel(next:);
C(book:, n? += 1) distinct :- After(book:), ~IsSequel(book:);
@OrderBy(Q, "book", "n");
Q(book:, n: n + 1) :- C(book:, n:);
