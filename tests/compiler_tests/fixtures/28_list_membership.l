# Test: List membership edge cases

# Data
Items("apple", "fruit", 1.50);
Items("banana", "fruit", 0.75);
Items("carrot", "vegetable", 0.50);
Items("milk", "dairy", 2.00);
Items("bread", "grain", 1.25);

# Simple membership check
IsFruit(name, price) :-
  Items(name, category, price),
  category in ["fruit", "vegetable"];

# Membership with strings
TargetItems(name, price) :-
  Items(name, category, price),
  name in ["apple", "milk", "bread"];

# Negated membership
NotDairy(name, category) :-
  Items(name, category, price),
  ~(category in ["dairy"]);

# Range-based membership
Numbers(x) :- x in Range(5);
SmallNums(x) :- Numbers(x), x in [0, 1, 2];

@OrderBy(Test, "name");
Test(name:, price:) :- IsFruit(name, price);
