# Every later book in the series of book 2.
# Expect: rows Q = [(3,)]
Sequel(book: 2, next: 3);
Sequel(book: 4, next: 5);
Sequel(book: 8, next: 9);
Sequel(book: 1, next: 2);
@Recursive(After, 6);
After(book:, next:) distinct :- Sequel(book:, next:);
After(book:, next: n) distinct :- After(book:, next:), Sequel(book: next, next: n);
Q(next:) :- After(book: 2, next:);
