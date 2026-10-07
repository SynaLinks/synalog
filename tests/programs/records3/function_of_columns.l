# A record-valued function of columns.
# Expect: rows Q = [('Dune', 'Dune (1965)'), ('Emma', 'Emma (1815)'), ('Kim', 'Kim (1901)'), ('Persuasion', 'Persuasion (1817)'), ('Solaris', 'Solaris (1961)'), ('Ubik', 'Ubik (1969)'), ('Valis', 'Valis (1981)')]
B(id: 1, title: "Dune", author: "herbert", year: 1965, pages: 412, sf: true);
B(id: 2, title: "Emma", author: "austen", year: 1815, pages: 474, sf: false);
B(id: 3, title: "Ubik", author: "dick", year: 1969, pages: 202, sf: true);
B(id: 4, title: "Kim", author: "kipling", year: 1901, pages: 368, sf: false);
B(id: 5, title: "Solaris", author: "lem", year: 1961, pages: 204, sf: true);
B(id: 6, title: "Persuasion", author: "austen", year: 1817, pages: 249, sf: false);
B(id: 7, title: "Valis", author: "dick", year: 1981, pages: 271, sf: true);
Label(t, y) = {text: t ++ " (" ++ ToString(y) ++ ")"};
@OrderBy(Q, "title", "label");
Q(title:, label: Label(title, year).text) :- B(title:, year:);
