# Test: Each author's book of least pages, as a record. (from tests/programs/records3/min_pages_record_per_author.l)

B(id: 1, title: "Dune", author: "herbert", year: 1965, pages: 412, sf: true);
B(id: 2, title: "Emma", author: "austen", year: 1815, pages: 474, sf: false);
B(id: 3, title: "Ubik", author: "dick", year: 1969, pages: 202, sf: true);
B(id: 4, title: "Kim", author: "kipling", year: 1901, pages: 368, sf: false);
B(id: 5, title: "Solaris", author: "lem", year: 1961, pages: 204, sf: true);
B(id: 6, title: "Persuasion", author: "austen", year: 1817, pages: 249, sf: false);
B(id: 7, title: "Valis", author: "dick", year: 1981, pages: 271, sf: true);
M(author:, m? ArgMin= {title:, v: pages} -> pages) distinct :- B(author:, title:, pages:);
@OrderBy(Q, "author", "title", "v");
Q(author:, title: m.title, v: m.v) :- M(author:, m:);
