# Test: A record built from two predicates. (from tests/programs/records3/join_into_a_record.l)

B(id: 1, title: "Dune", author: "herbert", year: 1965, pages: 412, sf: true);
B(id: 2, title: "Emma", author: "austen", year: 1815, pages: 474, sf: false);
B(id: 3, title: "Ubik", author: "dick", year: 1969, pages: 202, sf: true);
B(id: 4, title: "Kim", author: "kipling", year: 1901, pages: 368, sf: false);
B(id: 5, title: "Solaris", author: "lem", year: 1961, pages: 204, sf: true);
B(id: 6, title: "Persuasion", author: "austen", year: 1817, pages: 249, sf: false);
B(id: 7, title: "Valis", author: "dick", year: 1981, pages: 271, sf: true);
Au(author: "austen", display: "Austen");
Au(author: "dick", display: "Dick");
Au(author: "herbert", display: "Herbert");
Au(author: "kipling", display: "Kipling");
Au(author: "lem", display: "Lem");
J(r: {title:, by: display}) :- B(title:, author:), Au(author:, display:);
@OrderBy(Q, "title", "by");
Q(title: r.title, by: r.by) :- J(r:);
