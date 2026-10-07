# Test: All titles in order of pages, through a list of records. (from tests/programs/records3/titles_by_pages.l)

B(id: 1, title: "Dune", author: "herbert", year: 1965, pages: 412, sf: true);
B(id: 2, title: "Emma", author: "austen", year: 1815, pages: 474, sf: false);
B(id: 3, title: "Ubik", author: "dick", year: 1969, pages: 202, sf: true);
B(id: 4, title: "Kim", author: "kipling", year: 1901, pages: 368, sf: false);
B(id: 5, title: "Solaris", author: "lem", year: 1961, pages: 204, sf: true);
B(id: 6, title: "Persuasion", author: "austen", year: 1817, pages: 249, sf: false);
B(id: 7, title: "Valis", author: "dick", year: 1981, pages: 271, sf: true);
L(l? Array= pages -> {t: title}) distinct :- B(title:, pages:);
T(i:, t: Element(l, i).t) :- L(l:), i in Range(Size(l));
J(s? Array= i -> t) distinct :- T(i:, t:);
Q(s: Join(s, ", ")) :- J(s:);
