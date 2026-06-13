# run: ProductLabel, Rounded, Casts
@Engine("duckdb");

# Tables
Products(name: "espresso machine", price: 249.99);
Products(name: "grinder", price: 79.5);

# User-defined functions
Initial(s) = Upper(Substr(s, 1, 1));
FullLabel(name, price) = Upper(name) ++ " ($" ++ ToString(price) ++ ")";

# Rules

## String functions and concatenation.
@OrderBy(ProductLabel, "name");
ProductLabel(name:, label:, initial:, name_length:) :-
  Products(name:, price:),
  label == FullLabel(name, price),
  initial == Initial(name),
  name_length == Length(name);

## Math functions.
@OrderBy(Rounded, "name");
Rounded(name:, rounded:, floor:, sqrt:) :-
  Products(name:, price:),
  rounded == Round(price),
  floor == Floor(price),
  sqrt == Round(Sqrt(price));

## Type casting.
@OrderBy(Casts, "name");
Casts(name:, cents:, as_text:) :-
  Products(name:, price:),
  cents == ToInt64(price * 100),
  as_text == ToString(price);
