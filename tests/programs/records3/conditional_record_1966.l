# A record chosen by a conditional, then a field of it.
# Expect: rows Q = [(1, 'old', False), (2, 'old', False), (3, 'new', True), (4, 'old', False), (5, 'old', False), (6, 'old', False), (7, 'new', True)]
B(id: 1, title: "Dune", author: "herbert", year: 1965, pages: 412, sf: true);
B(id: 2, title: "Emma", author: "austen", year: 1815, pages: 474, sf: false);
B(id: 3, title: "Ubik", author: "dick", year: 1969, pages: 202, sf: true);
B(id: 4, title: "Kim", author: "kipling", year: 1901, pages: 368, sf: false);
B(id: 5, title: "Solaris", author: "lem", year: 1961, pages: 204, sf: true);
B(id: 6, title: "Persuasion", author: "austen", year: 1817, pages: 249, sf: false);
B(id: 7, title: "Valis", author: "dick", year: 1981, pages: 271, sf: true);
@OrderBy(Q, "id", "tag", "recent");
Q(id:, tag: c.tag, recent: c.recent) :- B(id:, year:), c == (if year > 1966 then {tag: "new", recent: true} else {tag: "old", recent: false});
