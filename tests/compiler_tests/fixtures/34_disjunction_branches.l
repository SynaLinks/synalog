# Test: Disjunction with different branch patterns

# Data
Products("laptop", 1000, "electronics");
Products("phone", 500, "electronics");
Products("book", 20, "media");
Products("headphones", 150, "electronics");

Discounts("laptop", 10);
Discounts("book", 50);

# Disjunction with different conditions
SpecialProducts(name, reason) :-
  (Products(name, price, category), price > 800, reason == "expensive") |
  (Products(name, price, category), category == "media", reason == "media_item");

# Disjunction where branches bind different vars
FeaturedItems(name, info) :-
  (Products(name, price, cat), price > 500, info == "premium") |
  (Discounts(name, pct), pct > 20, info == "on_sale");

# Three-way disjunction
CategoryFilter(name, tag) :-
  (Products(name, price, "electronics"), price > 200, tag == "tech") |
  (Products(name, price, "media"), tag == "content") |
  (Discounts(name, pct), pct > 30, tag == "deal");

@OrderBy(Test, "name");
Test(name:, reason:) distinct :- SpecialProducts(name, reason);
