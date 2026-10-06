# Not science fiction.
# Expect: rows Q = [(2,), (4,), (6,)]
B(id: 1, title: "Dune", author: "herbert", year: 1965, pages: 412, sf: true);
B(id: 2, title: "Emma", author: "austen", year: 1815, pages: 474, sf: false);
B(id: 3, title: "Ubik", author: "dick", year: 1969, pages: 202, sf: true);
B(id: 4, title: "Kim", author: "kipling", year: 1901, pages: 368, sf: false);
B(id: 5, title: "Solaris", author: "lem", year: 1961, pages: 204, sf: true);
B(id: 6, title: "Persuasion", author: "austen", year: 1817, pages: 249, sf: false);
B(id: 7, title: "Valis", author: "dick", year: 1981, pages: 271, sf: true);
Bk(id:, r: {title:, author:, year:, size: {pages:, long: pages > 300}, sf:}) :- B(id:, title:, author:, year:, pages:, sf:);
@OrderBy(Q, "id");
Q(id:) :- Bk(id:, r:), !r.sf;
