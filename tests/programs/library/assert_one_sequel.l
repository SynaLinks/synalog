# A book has one sequel.
# Expect: holds Sequel.functional
Sequel(book: 2, next: 3);
Sequel(book: 4, next: 5);
Sequel(book: 8, next: 9);
Sequel(book: 1, next: 2);
@Assert(Sequel, functional: "∀ b n m, Sequel b n → Sequel b m → n = m");
